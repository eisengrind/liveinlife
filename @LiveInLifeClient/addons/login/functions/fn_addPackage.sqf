
params [
	["_name", "", [""]],
	["_code", {}, [{}]]
];

if (_name == "") exitWith {};

if (isNil "lilc_login_packages") then
{
	lilc_login_packages = ([[], {}] call CBA_fnc_hashCreate);
};

[
	lilc_login_packages,
	_name,
	_code
] call CBA_fnc_hashSet;