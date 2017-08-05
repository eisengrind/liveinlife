
private _index = param [0, -1, [-1]];

try {
    if (_index <= -1) throw false;
    call lilc_garage_fnc_updateMenu;
} catch {
    _exception;
};
