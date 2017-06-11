
params [
    ["_permissionName", "", [""]],
    ["_permissions", (if (isNil "lilc_permissions_permissions") then { []; } else { lilc_permissions_permissions; }), [[]]]
];

try
{
    if (_permissionName == "") throw false;

    _splittedPermissionName = (_permissionName splitString ".");
    reverse _splittedPermissionName;

    _haveAllPermissionPermissions = [];
    for [{private _z = 0}, {_z < (count _splittedPermissionName)}, {_z = _z + 1}] do
    {
        private _var = (_permissionName splitString ".");
        reverse _var;
        for [{private _i = 0}, {_i < _z}, {_i = _i + 1}] do
        {
            _var deleteAt 0;
        };
        _var set [0, "*"];
        reverse _var;
        _haveAllPermissionPermissions pushBack (_var joinString ".");
    };
    _haveAllPermissionPermissions pushBack _permissionName;

    {
        private _permission = _x;
        {
            if (_x == _permission) throw true;
        } forEach _permissions;
    } forEach _haveAllPermissionPermissions;

    throw false; //fuck this...
}
catch
{
    _exception;
};
