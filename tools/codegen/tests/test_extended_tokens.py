"""Run the real generator in an isolated token tree; never mutate repository inputs."""
import ast
import json
from pathlib import Path
import shutil
import subprocess

import pytest

ROOT = Path(__file__).resolve().parents[3]


def generate(tmp_path, change):
    shutil.copytree(ROOT / "tokens", tmp_path / "tokens")
    script = tmp_path / "tools/codegen/generate.rb"
    script.parent.mkdir(parents=True)
    shutil.copyfile(ROOT / "tools/codegen/generate.rb", script)
    tokens = tmp_path / "tokens/material3/extended-color-schemes.json"
    data = json.loads(tokens.read_text())
    change(data)
    tokens.write_text(json.dumps(data))
    return subprocess.run(["ruby", str(script)], capture_output=True, text=True)


@pytest.mark.parametrize("change,message", [
    (lambda d: d["dark"].update(extra="#123456"), "light/dark role names must match"),
    (lambda d: d["dark"].pop("success"), "light/dark role names must match"),
    (lambda d: [d[m].update({"bad-role": "#123456"}) for m in ("light", "dark")], "invalid extended role name"),
    (lambda d: d.update(light=[]), "extended.light must be a non-empty role map"),
    (lambda d: d["dark"].update(success="invalid"), "invalid hex for extended.dark.success"),
])
def test_invalid_tokens_fail_before_writing(tmp_path, change, message):
    result = generate(tmp_path, change)
    assert result.returncode != 0
    assert message in result.stderr
    assert "KeyError" not in result.stderr
    assert not (tmp_path / "packages").exists()


def test_single_role_still_generates_python_tuple(tmp_path):
    def only_success(data):
        for mode in ("light", "dark"):
            data[mode] = {"success": data[mode]["success"]}
    result = generate(tmp_path, only_success)
    assert result.returncode == 0, result.stderr
    module = ast.parse((tmp_path / "packages/python/src/material_design_color/theme.py").read_text())
    assignment = next(node for node in module.body if isinstance(node, ast.AnnAssign)
                      and node.target.id == "EXTENDED_COLOR_ROLES")
    assert ast.literal_eval(assignment.value) == ("success",)


@pytest.mark.parametrize("role", ["primary", "error"])
def test_extended_roles_cannot_shadow_standard_roles(tmp_path, role):
    def collide(data):
        for mode in ("light", "dark"):
            data[mode][role] = "#123456"
    result = generate(tmp_path, collide)
    assert result.returncode != 0
    assert f"extended roles collide with standard roles: {role}" in result.stderr
    assert not (tmp_path / "packages").exists()


@pytest.mark.parametrize("role", ["appearance", "extendedColors", "roleColor", "asHexMap",
                                  "asExtendedHexMap", "contrastIssues", "validatedContrastIssues", "overridingExtended",
                                  "tonalSpotLight", "class", "return", "rawValue"])
def test_extended_roles_cannot_shadow_generated_members(tmp_path, role):
    def collide(data):
        for mode in ("light", "dark"):
            data[mode][role] = "#123456"
    result = generate(tmp_path, collide)
    assert result.returncode != 0
    assert f"extended roles collide with reserved members: {role}" in result.stderr
    assert not (tmp_path / "packages").exists()


def test_python_normalized_names_cannot_collide(tmp_path):
    def collide(data):
        for mode in ("light", "dark"):
            data[mode].update(fooBar="#123456", fooBAR="#123456")
    result = generate(tmp_path, collide)
    assert result.returncode != 0
    assert "role names collide after Python normalization" in result.stderr
    assert not (tmp_path / "packages").exists()
