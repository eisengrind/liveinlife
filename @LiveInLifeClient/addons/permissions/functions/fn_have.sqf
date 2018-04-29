
params [
    ["_permissionName", "", [""]],
    ["_permissions", (if (isNil "lilc_permissions_permissions") then { []; } else { +(lilc_permissions_permissions); }), [[]]]
];

private _rank = [player getVariable ["lilc_factionRankID", 0]] call lilc_factions_interface_fnc_getRank;
if ((count _rank) > 0) then {
    _permissions append (_rank select 5);
};

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
        for "_i" from 0 to _z - 1 do
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
