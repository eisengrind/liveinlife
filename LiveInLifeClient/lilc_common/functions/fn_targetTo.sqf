
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_position", [], [ObjNull, []]]
];

try {
    if (isNull _unit) throw false;
    if (_position isEqualType ObjNull) then { if (isNull _position) throw false; };
    if (_position isEqualType []) then { if ((count _position) != 3) throw false; };

    
    _direction = _unit getDir _position;
    _unit setDir _direction;
} catch {
    _exception;
};
