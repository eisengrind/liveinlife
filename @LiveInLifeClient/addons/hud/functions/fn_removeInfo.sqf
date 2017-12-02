
params [
	["_name", "", [""]]
];

if (isNil "_name" || _name == "") exitWith { ""; };

lilc_hud_infos = ([lilc_hud_infos, _name] call CBA_fnc_hashRem);

_name;
