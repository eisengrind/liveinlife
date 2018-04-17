
private _curIndex = tvCurSel 1002;
if ((count _curIndex) <= 0) exitWith {};

private _value = tvValue [1002, _curIndex];
if (_value != 1) exitWith {};

private _group = call compile tvData [1002, _curIndex];
if (isNull _group) exitWith {};

[player] joinSilent _group;

[format[
    "Du bist der Gruppe %1 beigetreten.",
    groupId _group;
]] call lilc_ui_fnc_hint;
