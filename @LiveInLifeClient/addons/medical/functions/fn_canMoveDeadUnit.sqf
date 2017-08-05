
private _corpse = param [0, objNull, [objNull]];

try {
    if (isNull _corpse) throw false;
    if !(isPlayer _corpse) throw false;
    if (_corpse isEqualTo player) throw false;
    //if !(_corpse getVariable ["lilc_isStabilized", false]) throw false;
    if !(_corpse getVariable ["lilc_isDead", false]) throw false;
    if !((_corpse distance player) <= 4) throw false;
    if !((vehicle player) isEqualTo player) throw false;
    if (!isNull (_corpse getVariable ["lilc_medical_currentTransporteur", objNull])) throw false;

    throw true;
} catch {
    _exception;
};
