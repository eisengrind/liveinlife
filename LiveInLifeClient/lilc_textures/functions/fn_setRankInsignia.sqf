
params [
    ["_rankInsignia", "", [""]],
    ["_unit", ObjNull, [ObjNull]]
];


if (isNull _unit || !alive _unit) exitWith {};
if (_rankInsignia == "") exitWith {};
if (!(isClass (configFile >> "CfgUnitInsignia" >> _rankInsignia))) exitWith {};

_texturePath = "";
_config = [["CfgUnitInsignia", _rankInsignia], configFile] call BIS_fnc_loadClass;

_index = -1;
{
	if (_x == "insignia") exitwith { _index = _foreachindex; };
} foreach getarray (configfile >> "CfgVehicles" >> gettext (configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");
if (_index == -1) exitWith {};

if (_rankInsignia != "") then {
    _texturePath = getText (_config >> "texture");
};

[_texturePath, _unit, _index] call lilc_textures_fnc_setObject;
