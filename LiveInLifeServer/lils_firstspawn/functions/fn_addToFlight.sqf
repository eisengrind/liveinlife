
_unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(alive _unit) throw false;
    if !(isPlayer _unit) throw false;

    lils_firstspawn_queue pushBack _unit;
} catch {
    _exception;
};
