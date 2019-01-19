
params [
    ["_layer", "", ["", 0]],
    ["_ressource", "", [""]],
    ["_seconds", 1, [0]],
    ["_map", false, [false]]
];

_layer cutRsc [_ressource, "PLAIN", _seconds, _map];
