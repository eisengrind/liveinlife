
private _curIndex = tvCurSel 1002;
if ((count _curIndex) <= 0) exitWith {};

private _value = tvValue [1002, _curIndex];
if (_value != 1) exitWith {};

private _group = groupFromNetId tvData [1002, _curIndex];
if (isNull _group) exitWith {};

_group setGroupIdGlobal [ctrlText 1402];
_group setVariable ["lilc_groupDescription", ctrlText 1400, true];
_group setVariable ["lilc_groupIcon", lbData [2100, lbCurSel 2100], true];
_group setVariable ["lilc_groupFrequency", ctrlText 1401, true];

["Informationen wurden gespeichert."] call lilc_ui_fnc_hint;

call lilc_patrols_fnc_patrolUpdate;
