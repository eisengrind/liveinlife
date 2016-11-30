
private _corpse = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _corpse) throw false;
    if (alive _corpse) throw false;
    if ((_corpse getVariable ["lilc_bodyHided", false])) throw false;

    //TODO: Insert animation for hiding the corpse...

    hideBody _corpse;
    _corpse setVariable ["lilc_bodyHided", true, true];
    throw true;
} catch {
    _exception;
};
