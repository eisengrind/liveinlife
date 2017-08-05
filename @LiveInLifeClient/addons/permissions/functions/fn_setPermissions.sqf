
private _permissions = param [0, [], [[]]];

try {
    if ((count _permissions) <= 0) throw false;
    lilc_permissions_permissions = _permissions;
} catch {
    _exception;
};
