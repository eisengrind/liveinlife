
params [
    ["_sender", objNull, [objNull]]
];

try {
    if (isNull _sender) throw false;
    if !(isPlayer _sender) throw false;
    if (_sender isEqualTo player) throw false;
    if !(lilc_respawn_isRespawning) throw false;

    lilc_respawn_currentTimeout = (lilc_respawn_currentTimeout + (5 * 60));
    
    player setVariable ["lilc_isStabilized", true, true];

    throw true;
} catch {
    _exception;
};
