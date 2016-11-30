
disableSerialization;
_sliderValue = param [0, -1, [-1]];
if (_sliderValue == -1) exitWith {};
lilc_setting_viewDistance = round _sliderValue;
setViewDistance _sliderValue;

_ui = (findDisplay 1224);
if (isNull _ui) exitWith {};
_uiSlider = (_ui displayCtrl 1225);
_uiSlider ctrlSetTooltip str lilc_setting_viewDistance;

