
disableSerialization;

_ui = (findDisplay 1224);
_uiSlider = (_ui displayCtrl 1225);
_uiCheck1 = (_ui displayCtrl 1226);
_uiCheck2 = (_ui displayCtrl 1227);

_uiSlider sliderSetRange [100, 12000];
_uiSlider sliderSetPosition lilc_setting_viewDistance;
_uiSlider ctrlSetTooltip str lilc_setting_viewDistance;
_uiCheck1 ctrlEnable true;
_uiCheck2 ctrlEnable true;

if (settings_tagsEnabled) then {
    _uiCheck1 cbSetChecked true;
} else {
    _uiCheck1 cbSetChecked false;
};

if (profileNamespace getVariable ["lilc_joinIntroOff", false]) then {
    _uiCheck2 cbSetChecked true;
} else {
    _uiCheck2 cbSetChecked false;
};
