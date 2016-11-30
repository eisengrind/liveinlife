
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_id", 0, [0]]
];
if (isNull _unit) exitWith {};
if (_id <= 0) exitWith {};
_unit setVariable ["lilc_accountID", _id];
