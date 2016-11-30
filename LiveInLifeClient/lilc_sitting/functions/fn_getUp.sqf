
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_chair", ObjNull, [ObjNull]]
];
if (isNull _unit) exitWith {};
if (isNull _chair) exitWith {};

[_unit, "", true] call lilc_common_fnc_switchMove;
call lilc_login_fnc_setLastPosition;
_unit removeAction lilc_action_actionIndex;

_chair setVariable [lilc_action_isSitting, ObjNull, true];
lilc_action_isSitting = "";
