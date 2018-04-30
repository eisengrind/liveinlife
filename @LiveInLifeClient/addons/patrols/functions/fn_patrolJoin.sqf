
private _curIndex = tvCurSel 1002;
if ((count _curIndex) <= 0) exitWith {};

private _value = tvValue [1002, _curIndex];
if (_value != 1) exitWith {};

private _group = groupFromNetId tvData [1002, _curIndex];
if (isNull _group) exitWith {};

[player] joinSilent _group;

[format[
    "STR_lilc_patrols_Script_GroupJoined" call BIS_fnc_localize,
    groupId _group
]] call lilc_ui_fnc_hint;

call lilc_patrols_fnc_patrolUpdate;
