
disableSerialization;
if (lilc_shopVehicles_currentShop == "") exitWith {};
if (!dialog) exitWith {};
if (lilc_shopVehicles_vehicleIndex <= -1) exitWith {};

if !(isClass (missionConfigFile >> "CfgVehicleShops" >> lilc_shopVehicles_currentShop)) exitWith {};
_vehicles = ("((player_group select 0) in (getArray (_x >> ""groups"")))" configClasses (missionConfigFile >> "CfgVehicleShops" >> lilc_shopVehicles_currentShop >> "vehicles"));
if ((count _vehicles) < 0 && lilc_shopVehicles_vehicleIndex > ((count _vehicles) - 1)) exitWith {};

_currentVehicle = (_vehicles select lilc_shopVehicles_vehicleIndex);
if (isNull _currentVehicle) exitWith {};
lilc_shopVehicles_vehicleClassname = (configName _currentVehicle);

if (!isNull lilc_shopVehicles_camera) then {
    lilc_shopVehicles_camera = ([format["%1__%2", lilc_shopVehicles_currentShop, (configName _currentVehicle)], 3, lilc_shopVehicles_camera] call lilc_common_fnc_createStaticCamera);
};

_vehicleConfig = (configFile >> "CfgVehicles" >> (configName _currentVehicle));

_ui = (findDisplay 1240);
if (isNull _ui) exitWith {};
_uiDescription = _ui displayCtrl 1242;
_uiTitle = _ui displayCtrl 1241;

_uiDescription ctrlSetStructuredText parseText format["<t size='1.4'>%1</t><br /><br /><t>Tank-Größe: %2</t><br /><t>Höchstgeschwindigkeit: %3</t><br /><t>Maximale Ladung: %4</t><br /><t>Kaufpreis: %5</t>",
    (getText (missionConfigFile >> lilc_shopVehicles_currentShop >> "name")),
    (getText (_vehicleConfig >> "fuelCapacity")),
    (getNumber (_vehicleConfig >> "maxSpeed")),
    (getNumber (_vehicleConfig >> "maximumLoad")),
    ([lilc_shopVehicles_currentShop, lilc_shopVehicles_vehicleClassname] call lilc_economy_fnc_getBuyPrice)
];
_uiTitle ctrlSetStructuredText parseText format["<t align='center'>%1</t>", (getText (_vehicleConfig >> "displayName"))];
