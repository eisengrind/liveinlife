
disableSerialization;
params [
    ["_ressource", "", [""]],
    ["_seconds", 1, [0]],
    ["_layer", 99, [0]],
    ["_map", false, [false]]
];
if (_ressource == "") exitWith {};
_layer cutRsc [_ressource, "PLAIN", _seconds, _map];
