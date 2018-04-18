
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};

private _factionID = _unit getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

private _ranks = [format[
    "SELECT rid FROM faction_ranks WHERE fid = %1",
    _factionID
]] call lils_database_fnc_fetchObjects;

{
    _ranks set [_forEachIndex, _x select 0];
} forEach _ranks;

[_ranks, "lilc_factions_interface_fnc_overviewSetRanks", _unit] call lilc_common_fnc_send;
