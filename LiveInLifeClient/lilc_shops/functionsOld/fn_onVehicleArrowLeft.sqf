
if !(isClass (missionConfigFile >> "CfgVehicleShops" >> shop_vehicles_currentShop >> "vehicles")) exitWith {};
if (lilc_shopVehicles_vehicleIndex <= -1) exitWith {};

_vehicles = ("((player_group select 0) in (getArray (_x >> ""groups"")))" configClasses (missionConfigFile >> "CfgVehicleShops" >> lilc_shopVehicles_currentShop >> "vehicles"));
if ((count _vehicles) <= 0) exitWith {};

if (lilc_shopVehicles_vehicleIndex == ((count _vehicles) - 1)) then {
    lilc_shopVehicles_vehicleIndex = 0;
} else {
    lilc_shopVehicles_vehicleIndex = lilc_shopVehicles_vehicleIndex + 1;
};

call lilc_shops_fnc_updateVehicleMenu;

ctrlEnable [1243, false];
ctrlEnable [1244, false];
waitUntil { camCommitted lilc_shopVehicles_camera };
ctrlEnable [1243, true];
ctrlEnable [1244, true];
