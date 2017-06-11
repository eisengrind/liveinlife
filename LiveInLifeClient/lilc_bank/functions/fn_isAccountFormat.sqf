
private _account = param [0, [], [[]]];

try {
    if ((count _account) != 5) throw false;
    throw true;
} catch {
    _exception;
};
