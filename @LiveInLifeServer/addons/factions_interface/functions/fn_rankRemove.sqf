
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]]
];

if (isNull _unit) exitWith {};
if (_rankID <= 0) exitWith {};

private _fid = _unit getVariable ["lilc_factionID", -1];
if (_fid <= -1) exitWith {};

[_rankID] call lils_factions_interface_fnc_removeRank;

[nil, "lilc_factions_interface_fnc_rankRemoved", _unit] call lilc_common_fnc_send;
[_unit] call lils_factions_interface_fnc_overviewGetRanks;
