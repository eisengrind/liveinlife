
[_this] params [
    ["_permissions", [], [[]]]
];

private _factionConfig = [player getVariable ["lilc_factionID", -1]] call lilc_factions_fnc_getFactionConfig;
if (isNull _factionConfig) exitWith {};

lnbClear 1500;
{
    private _permissionActivated = _x in _permissions;
    private _i = lnbAddRow [1500, [
        "",
        (format["STR_permission_displayName_%1", _x]) call BIS_fnc_localize,
        (if (_permissionActivated) then {
            "Ja";
        } else {
            "Nein";
        })
    ]];
    lnbSetData [1500, [_i, 1], _x];
    lnbSetValue [1500, [_i, 2], parseNumber _permissionActivated];
} forEach getArray(_factionConfig >> "selectablePermissions");
