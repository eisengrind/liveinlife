
private _garageType = param [0, "", [""]];

try {
    if (dialog) throw false;
    private _garageConfig = [_garageType] call lilc_garage_fnc_getGarageConfig;
    if (isNull _garageConfig) throw false;
    lilc_garage_currentGarage = _garageType;

    private _garageCameraName = getText(_garageConfig >> "viewPosition");
    if (_garageCameraName != "") then {
        //TODO: create function called isStaticCamera(camName)
        if !(isClass(missionConfigFile >> "CfgStaticCamera" >> _garageCameraName)) exitWith {};
        [1] call lilc_ui_fnc_fadeInBlack;
        sleep 1.1;
        lilc_garage_currentCamera = [_garageCameraName, 0] call lilc_common_fnc_createStaticCamera;
        [2] call lilc_ui_fnc_fadeOutBlack;
    };

    createDialog "lilc_garageMenu";

    disableSerialization;
    private _ui = (findDisplay 1265);
    if (isNull _ui) throw false;

    private _uiListVehicles = (_ui displayCtrl 1266);

    call lilc_garage_fnc_updateMenu;
    lbClear _uiListVehicles;
    _uiListVehicles lbAdd "Fahrzeuge werden geladen...";
    _uiListVehicles ctrlEnable false;
    [[player, _garageType], "lils_garage_fnc_getVehicles"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};

/*
params [
    ["_staticPosition", "", [""]],
    ["_types", ["Car"], [[]]]
];
if (_staticPosition == "") exitWith {};
if ((count _types) <= 0) exitWith {};

TYPES:
    Car, Truck, Plane, Helicopter, Boat / Ship

{
    _types set [_forEachIndex, (switch (_x) do {
        case "Car": { "Car_F"; };
        case "Truck": { "Truck_F"; };
        case "Boat": { "Boat_F"; };
        case "Ship": { "Ship_F"; };
        default { _x; };
    })];
} forEach _types;

lilc_garage_currentStaticPosition = _staticPosition;
disableSerialization;
if (!dialog) then { createDialog "garage_menu"; };

_ui = (findDisplay 1265);
if (isNull _ui) exitWith {};

_uiList = _ui displayCtrl 1266;
_uiDescription = _ui displayCtrl 1267;
_uiButtonRequest = _ui displayCtrl 1268;

lbClear _uiList;
_index = -1;
_index = _uiList lbAdd "Lade Fahrzeuge...";
_uiList lbSetData [_index, "-1"];

[[player, _types], "lils_garage_fnc_returnVehicles"] call lilc_common_fnc_sendToServer;

*/
