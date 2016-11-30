
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_type", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if (_type <= 0) throw false;
    if !(isPlayer _unit) throw false;
    if ((_unit getVariable ["lilc_tiedUp", 0]) != 0) throw false;

    switch (_type) do {
        case 1: {
            if !(["lilci_wire_F"] call lilc_inventory_fnc_remove) throw false;
        };

        case 2: {
            if !(["lilci_bracelets_F"] call lilc_inventory_fnc_remove) throw false;
        };
    };
    
    disableSerialization;
    ["lilc_progressBar", 0, 100, false] call lilc_ui_fnc_fadeInTitles;
    _ui = uiNamespace getVariable ["progressBar", displayNull];
    if (isNull _ui) throw false;
    private _uiProgressBar = _ui displayCtrl 1321;
    private _uiProgressBarText = _ui displayCtrl 1322;

    _uiProgressBarText ctrlSetText = format["Spieler festnehmen... (0%1)", "%"];

    lilc_action_animDone = false;
    _sleep = (8 / 100);

    for [{_i = 0}, {_i < 100}, {_i = _i + 1}] do {
        if (lilc_action_animDone) then {
            player playMoveNow "Acts_carFixingWheel";
            player addEventHandler ["AnimDone", { lilc_action_animDone = true; }];
            lilc_action_animDone = false;
        };
        
        _uiProgressBar progressSetPosition ((_i + 1) / 100);
        _uiProgressBarText ctrlSetText format["Spieler festnehmen... (%1%2)", (_i + 1), "%"];

        sleep _sleep;
    };

    lilc_action_animDone = false;    
    [0, 100] call lilc_ui_fnc_fadeOutTitles;
    [[_type], "lilc_actions_fnc_leash", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
