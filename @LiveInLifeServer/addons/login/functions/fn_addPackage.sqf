
params [
	["_name", "", [""]],
	["_code", {}, [{}]]
];

if (_name == "") exitWith {};

if (isNil "lils_login_packages") then
{
	lils_login_packages = ([[], {}] call CBA_fnc_hashCreate);
};

[
	lils_login_packages,
	_name,
	_code
] call CBA_fnc_hashSet;