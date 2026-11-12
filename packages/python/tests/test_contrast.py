import math
from dataclasses import FrozenInstanceError

import pytest
from material_design_color import MaterialColor, MaterialContrastIssue, LIGHT_COLOR_SCHEME, custom_color_scheme


def test_reference_ratios():
    black = MaterialColor('black', '#000000')
    white = MaterialColor('white', '#FFFFFF')
    red = MaterialColor('red', '#FF0000')
    assert black.contrast_ratio(white) == 21
    assert white.contrast_ratio(white) == 1
    assert red.contrast_ratio(white) == pytest.approx(3.9984767707539985)
    assert red.contrast_ratio(white) == white.contrast_ratio(red)


@pytest.mark.parametrize('minimum', [math.nan, math.inf, -math.inf, 0.99, 21.01])
def test_external_threshold(minimum):
    with pytest.raises(ValueError):
        LIGHT_COLOR_SCHEME.contrast_issues(minimum)


def test_final_values_and_pair_coverage():
    scheme = custom_color_scheme(overrides={'primary': '#FFFFFF', 'onPrimary': '#FFFFFF',
                                            'warning': '#000000', 'onWarning': '#000000'})
    issues = scheme.contrast_issues()
    assert MaterialContrastIssue('primary', 'onPrimary', 1) in issues
    assert MaterialContrastIssue('warning', 'onWarning', 1) in issues
    assert isinstance(issues, tuple)
    with pytest.raises(FrozenInstanceError):
        issues[0].ratio = 0
    assert scheme.contrast_issues(1) == ()
    pairs = LIGHT_COLOR_SCHEME.contrast_issues(21)
    assert len(pairs) == 35
    assert any(x.color_role == 'primaryFixedDim' and x.on_role == 'onPrimaryFixedVariant' for x in pairs)
    assert any(x.color_role == 'surfaceContainerHighest' and x.on_role == 'onSurface' for x in pairs)
