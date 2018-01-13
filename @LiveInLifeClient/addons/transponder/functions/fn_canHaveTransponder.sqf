
private _vehicle = param [0, objNull, [objNull]];

try {
    if (isNull _vehicle) throw false;
    if (_vehicle == player) throw false;
    if !(isPlayer _vehicle) throw false;
    if !(alive _vehicle) throw false;
    throw true;
} catch {
    _exception;
};
