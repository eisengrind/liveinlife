
[_this] params [
	["_packages", [], [[]]]
];

{
	[(str ([_packages, _x] call CBA_fnc_hashGet)), "lilc_login"] call lilc_common_fnc_diag_log;
	([_packages, _x] call CBA_fnc_hashGet) call ([lilc_login_packages, _x] call CBA_fnc_hashGet);
} forEach ([_packages] call CBA_fnc_hashKeys);

["login successful", "lilc_login"] call lilc_common_fnc_diag_log;
lilc_login_loginSuccessful = true;
