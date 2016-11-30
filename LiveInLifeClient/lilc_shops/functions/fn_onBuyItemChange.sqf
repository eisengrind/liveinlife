
private _index = param [0, -1, [0]];

try {
    if (_index <= -1) throw false;

    private _classname = lbData [1202, _index];
    if (_classname == "") throw false;
    
    if !([_classname] call lilc_shops_fnc_isOtherItem) throw false;
} catch {
    _exception;
};
