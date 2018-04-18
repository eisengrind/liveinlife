
[_this] params [
    ["_vehicles", [], [[]]]
];

private _factionConfig = [player getVariable ["lilc_factionID", -1]] call lilc_factions_fnc_getFactionConfig;
if (isNull _factionConfig) exitWith {};

lnbClear 1501;
{
    private _vehicleConfig = [_x select 0] call lilc_common_fnc_getClassnameConfig;
    private _vehicleActivated = (_x select 0) in _vehicles;
    private _i = lnbAddRow [1501, [
        "",
        getText(_vehicleConfig >> "displayName"),
        (if (_vehicleActivated) then {
            "Ja";
        } else {
            "Nein";
        })
    ]];
    lnbSetData [1501, [_i, 1], _x select 0];
    lnbSetValue [1501, [_i, 2], parseNumber _vehicleActivated];
    lnbSetPicture [1501, [_i, 0], gettext(_vehicleConfig >> "picture")];
} forEach getArray(_factionConfig >> "defaultVehicles");
