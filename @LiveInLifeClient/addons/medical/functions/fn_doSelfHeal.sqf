
params [
    ["_timeout", 0, [0]],
    ["_cost", 0, [0]],
    ["_factionID", -1, [0]]
];

if (_timeout <= 0) exitWith {};
if (_cost < 0) exitWith {};

if (({
    ([_x] call lilc_common_fnc_isAlive) &&
    (_x getVariable ["lilc_factionID", -1]) == _factionID
} count allPlayers) > 0 && _factionID > -1) exitWith {
    ["Es sind Sanitäter im Dienst.", "ERROR"] call lilc_ui_fnc_hint;
};

if !([_cost] call lilc_cash_fnc_have) exitWith {
    ["Du besitzt nicht genügend Bargeld.", "ERROR"] call lilc_ui_fnc_hint;
};

if !(createDialog "lilc_progressBar") exitWith {};

disableSerialization;
private _ui = (findDisplay 1320);
private _uiProgressBar = (_ui displayCtrl 1321);
private _uiProgressBarText = (_ui displayCtrl 1322);

private _time = time;
private _curPos = position player;

while {
    time < (_time + _timeout)
} do {
    if ((_curPos distance player) > 10) exitWith {};
    if (lilc_action_interrupted) exitWith {};
    if ((vehicle player) != player) exitWith {};

    private _t = (time - _time) / _timeout;
    _uiProgressBar progressSetPosition _t;
    _uiProgressBarText ctrlSetStructuredText parseText format[
        "Du wirst behandelt (%1%2)",
        round (_t * 100),
        "%"
    ];
};

if ((_curPos distance player) > 10 && lilc_action_interrupted && (vehicle player) != player) exitWith {
    ["Du hast die Behandlung abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
};

lilc_action_interrupted = false;
closeDialog 1320;

if !([_cost] call lilc_cash_fnc_remove) then {
    ["Du besitzt nicht genügend Bargeld.", "ERROR"] call lilc_ui_fnc_hint;
};

[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
player setDamage 0;

["Du wurdest behandelt."] call lilc_ui_fnc_hint;
