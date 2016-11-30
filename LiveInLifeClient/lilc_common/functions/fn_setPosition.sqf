
params [
    ["_object", ObjNull, [ObjNull]],
    ["_position", [], [[]]]
];

try {
    if (isNull _object) throw false;
    if ((count _position) != 2) throw false;
    if ((count (_position select 0)) != 3) throw false;
    if !((_position select 1) isEqualType 0) throw false;

    _object setPosASL (_position select 0);
    _object setDir (_position select 1);
} catch {
    _exception;
};
