
disableSerialization;
private _ui = (findDisplay 2306);
if (isNull _ui) exitWith {};

private _cI = (lbCurSel 1500);
if (_cI <= -1) exitWith {};

private _data = (call compile lbData [1500, _cI]); //[vIClassname, displayName, [pName, aID, additional, grid, curTime]]

private _uiProgress = (_ui displayCtrl 1200);
private _uiStructuredText = (_ui displayCtrl 1004);

ctrlEnable [1500, false];
ctrlEnable [2100, false];
ctrlEnable [1600, false];
ctrlEnable [1601, false];

private _timeout = ((random [20, 30, 40]));
private _time = time;

while {
    ((_time + _timeout) > time);
} do {
    if (isNull _ui) exitWith {};

    private _t = ((time - _time) / _timeout);
    _uiProgress progressSetPosition _t;
};

if (isNull _ui) exitWith {};

[
    player,
    (_data select 0),
    (_data select 2)
] call lilc_virtual_inventory_fnc_remove;

_ui setVariable ["lilc_proofs_data_tmp", _data];

_uiStructuredText ctrlSetStructuredText parseText "Bitte warten...";
[[player, ((_data select 2) select 1)], "lils_proofs_fnc_getExamination"] call lilc_common_fnc_sendToServer;

lbDelete [1500, _cI];
lbSetCurSel [1500, -1];
