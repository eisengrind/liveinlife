
disableSerialization;
_ui = (findDisplay 1224);
_uiCheck1 = (_ui displayCtrl 1226);
_state = cbChecked _uiCheck1;

if !(_state isEqualTo lilc_setting_tagsEnabled) then {
    if (_state) then {
        lilc_tags_fnc_enableTags;
    } else {
        lilc_tags_fnc_disableTags;
    };
};
