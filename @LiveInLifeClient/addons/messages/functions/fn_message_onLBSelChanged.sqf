
disableSerialization;
params [
    ["_control", controlNull, [controlNull]],
    ["_index", -1, [-1]]
];

private _mI = (_control lbValue _index);
private _m = (lilc_messages_messages select _mI);

private _ui = (ctrlParent _control);
private _uiTextMessage = (_ui displayCtrl 1100);

_uiTextMessage ctrlSetStructuredText parseText format[
    ("STR_lilc_messages_StringText_messageFrom" call BIS_fnc_localize),
    (_m select 1),
    (_m select 2)
];
