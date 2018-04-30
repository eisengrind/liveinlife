
params [
    ["_permission", "", [""]]
];

private _permissionFormat = format["STR_permission_displayName_%1", _permission];
[_permission, localize _permissionFormat] select (isLocalized _permissionFormat);
