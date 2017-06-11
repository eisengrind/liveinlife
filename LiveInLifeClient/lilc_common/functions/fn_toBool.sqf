
private _data = param [0, nil];

try {
    if (_data isEqualTypeAny [objNull, controlNull, displayNull, grpNull, locationNull, taskNull, scriptNull, configNull]) then {
        if (isNull _data) throw false;

        throw true;
    } else {
        if (isNil { _data }) throw false;
        if (_data isEqualType []) then { if ((count _data) <= 0) throw false; };
        if (_data isEqualType "") then { if (_data == "") throw false; };
        if (_data isEqualType 0) then {
            if (_data <= 0) throw false;
        };

        throw true;
    };
	
	throw false;
} catch {
    _exception;
};
