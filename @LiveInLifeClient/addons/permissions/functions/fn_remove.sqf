
private _permissionName = param [0, "", ["", []]];

try {
    if (_permissionName isEqualType []) exitWith { { [_x] call lilc_permissions_fnc_remove; } forEach _permissionName; };
    if (isNil "lilc_permissions_permissions") then { lilc_permissions_permissions = []; };

    if (_permissionName == "") throw false;
    if !([_permissionName] call lilc_permissions_fnc_have) throw false;
    
    while { true } do {
        { if (_permissionName == _x) exitWith { lilc_permissions_permissions deleteAt _forEachIndex; }; } forEach lilc_permissions_permissions;
        if !(_permissionName in lilc_permissions_permissions) throw true;
    };

    throw false;
} catch {
    _exception;
};
