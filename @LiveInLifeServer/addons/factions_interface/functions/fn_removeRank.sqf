
params [
    ["_rankID", 0, [0]]
];

[format[
    "DELETE FROM faction_ranks WHERE rid = %1",
    _rankID
]] call lils_database_fnc_query;

private _rankVariable = format["lilc_factions_interface_ranks_%1", _rankID];
missionNamespace setVariable [_rankVariable, nil];
publicVariable _rankVariable;
