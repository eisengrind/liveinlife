
private _functions = param [0, [], ["", []]];

try {
    if (isNil "_functions") then { _functions = []; };
    if (_functions isEqualType "") then { _functions = [_functions]; };
    if ((count _functions) <= 0) throw false;
    
    {
        if (isNil _x) throw false;
    } forEach _functions;

    throw true;
} catch {
    _exception;
};
