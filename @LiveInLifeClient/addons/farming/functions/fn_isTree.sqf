
_object = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _object) throw false;
    if (((getModelInfo _object) select 0) in lilc_farming_trees) throw true;
    throw false;
} catch {
    _exception;
};
