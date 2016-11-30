
private _object = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _object) throw [[], 0];
    
    throw [(getPosASl _object), (getDir _object)];
} catch {
    _exception;
};
