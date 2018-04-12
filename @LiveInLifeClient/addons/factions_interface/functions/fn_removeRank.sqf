
params [
    ["_rankID", 0, [0]]
];

private _rankVariable = format["lilc_factions_interface_ranks_%1", _rankID];
missionNamespace setVariable [_rankVariable, nil];
publicVariable _rankVariable;
