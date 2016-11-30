
if (player_tagsIndex != "") then {
    [player_tagsIndex, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    settings_tagsEnabled = false;
    player_tagsIndex = "";
    
    _ui = uiNamespace getVariable ["lilc_playerTags", displayNull];
    for [{_i = 0}, {_i < 64}, {_i = _i + 1}] do {
        _ctrlTag = _ui displayCtrl (1055 + _i);
        if (ctrlShown _ctrlTag) then {
            _ctrlTag ctrlShow false;
        };
    };
};
