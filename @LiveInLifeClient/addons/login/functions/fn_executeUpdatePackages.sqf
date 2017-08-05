
params [
	["_packages", lilc_login_update_defPackages, [[]]]
];

_pAndV = ([[], nil] call CBA_fnc_hashCreate);
{
	systemChat str _x;
	([_pAndV, _x, (call ([lilc_login_packages, _x] call CBA_fnc_hashGet))] call CBA_fnc_hashSet);
} forEach _packages;

[[player, _pAndV], "lils_login_fnc_executeUpdatePackages"] call lilc_common_fnc_sendToServer;
