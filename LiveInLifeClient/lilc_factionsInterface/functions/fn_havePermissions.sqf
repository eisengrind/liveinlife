
private _permissionName = param [0, [], ["", []]];

try {
    if (_permissionName isEqualType "") then {
        if (_permissionName == "") throw false;
        _permissionName = [_permissionName];
    };

    if ((count lilc_factionsInterface_permissions) <= 0) throw false;
    if ("*" in lilc_factionsInterface_permissions) throw true;

    {
        private _permission = _x;
        try {
            {
                if (_permission == _x) throw true;
            } forEach lilc_factionsInterface_permissions;
            throw false;
        } catch {
            if (!_exception) throw false;
        };
    } forEach _permissionName;

    throw true;
} catch {
    _exception;
};
