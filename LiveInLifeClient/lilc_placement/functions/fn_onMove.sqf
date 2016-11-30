
private _displacement = param [0, 0, [0]];

try {
    if (_displacement == 0) throw false;
    if !(lilc_placement_active) throw false;
    if (lilc_placement_objectMoving) throw false;

    lilc_placement_objectMoving = true;
    lilc_placement_displacement = _displacement;

    throw true;
} catch {
    _exception;
};
