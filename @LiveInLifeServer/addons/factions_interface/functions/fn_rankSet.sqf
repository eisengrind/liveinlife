
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]],
    ["_rankName", "", [""]],
    ["_rankTag", "", [""]],
    ["_rankInsignia", "", [""]],
    ["_rankPaycheck", 0, [0]],
    ["_rankPermissions", [], [[]]],
    ["_rankItems", [], [[]]],
    ["_rankVehicles", [], [[]]]
];

if (isNull _unit) exitWith {};

private _factionID = _unit getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};
if (_rankID <= 0) exitWith {};

[_rankID, _rankName, _rankTag, _rankInsignia, _rankPaycheck, _rankItems, _rankPermissions, _rankVehicles] call lils_factions_interface_fnc_setRank;

[nil, "lilc_factions_interface_fnc_rankSaved", _unit] call lilc_common_fnc_send;
