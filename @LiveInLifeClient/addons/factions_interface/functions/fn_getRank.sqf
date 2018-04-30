
params [
    ["_rankID", 0, [0]]
];

if (_rankID <= 0) exitWith {};

missionNamespace getVariable [format["lilc_factions_interface_ranks_%1", _rankID], []];
