
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_accountID", 0, [0]]
];

[_unit] call lils_login_fnc_executeSetPackages;
/*private _data = [];
_data = (["lilse_login_getJoinData", [_unit, _accountID]] call CBA_fnc_localEventReturn);

[[_data], "lilc_login_fnc_setJoinData", _unit] call lilc_common_fnc_send;*/
