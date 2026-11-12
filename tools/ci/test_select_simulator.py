import importlib.util
from pathlib import Path
import pytest

spec = importlib.util.spec_from_file_location("select_simulator", Path(__file__).with_name("select_simulator.py"))
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
select_simulator = module.select_simulator


def test_selects_numeric_latest_runtime_independent_of_input_order():
    entries = [
        ("com.apple.CoreSimulator.SimRuntime.iOS-9-3", [{"name": "iPhone X", "udid": "old"}]),
        ("com.apple.CoreSimulator.SimRuntime.iOS-18-9", [{"name": "iPhone Z", "udid": "minor9"}]),
        ("com.apple.CoreSimulator.SimRuntime.iOS-18-10", [{"name": "iPhone A", "udid": "a"}, {"name": "iPhone B", "udid": "b"}]),
    ]
    assert select_simulator({"devices": dict(entries)}) == "b"
    assert select_simulator({"devices": dict(reversed(entries))}) == "b"


def test_ignores_unavailable_and_non_iphone_devices():
    data = {"devices": {
        "com.apple.CoreSimulator.SimRuntime.iOS-27-2": [{"name": "iPhone A", "udid": "bad", "isAvailable": False}, {"name": "iPad", "udid": "ipad"}],
        "com.apple.CoreSimulator.SimRuntime.iOS-26-4": [{"name": "iPhone A", "udid": "good"}],
    }}
    assert select_simulator(data) == "good"


def test_missing_destination_has_actionable_error():
    with pytest.raises(ValueError, match="No available iPhone simulator"):
        select_simulator({"devices": {}})
