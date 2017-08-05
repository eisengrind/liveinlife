
private _permissionName = param [0, "", ["", []]];

try {
    if (_permissionName isEqualType "") then {
        _permissionName = [_permissionName];
    };
    if ((count _permissionName) <= 0) throw false;
    if (isNil "lilc_permissions_permissions") then { lilc_permissions_permissions = []; };
    
    {
        if (_x == "" && [_x] call lilc_permissions_fnc_have) then {
            lilc_permissions_permissions pushBack _x;
        };
    } forEach _permissionName;
    throw true;
} catch {
    _exception;
};
