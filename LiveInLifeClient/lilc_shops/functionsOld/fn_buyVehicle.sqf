
if (lilc_shopVehicles_vehicleClassname == "") exitWith { hint "Du hast kein Fahrzeug ausgewählt."; };

if (lilc_shopVehicles_currentShop == "") exitWith {};
if !(isClass (missionConfigFile >> "CfgVehicleShops" >> lilc_shopVehicles_currentShop)) exitWith {};
if !(isClass (missionConfigFile >> "CfgStaticPositions" >> format["%1_carSpawn", lilc_shopVehicles_currentShop])) exitWith {};

_price = ([lilc_shopVehicles_currentShop, lilc_shopVehicles_vehicleClassname] call lilc_economy_fnc_getBuyPrice);
if ((player_cash - _price) < 0) exitWith { hint "Du kannst dir dies momentan nicht leisten."; };

_position = [format["%1_carSpawn", lilc_shopVehicles_currentShop]] call lilc_common_fnc_getStaticPosition;
if ((count _position) <= 1) exitWith {};
//TODO: economy system for vehicles
//if !(_classname in []) exitWith {};

if ([(_position select 0), 5] call lilc_common_fnc_objectsNearby) exitWith { hint "Das Fahrzeug kann nicht ausgeliefert werden, da etwas den Ladepunkt blockiert."; };
[[lilc_shopVehicles_vehicleClassname, _position, player], "shop_vehicles_fnc_insertVehicle"] call lilc_common_fnc_sendToServer;
lilc_player_cash = lilc_player_cash - _price;
call lilc_shops_fnc_closeVehicleMenu;
lilc_shopVehicles_vehicleClassname = "";
titleText ["Um dein Fahrzeug zu öffnen, drücke die Taste 'U' während du auf das Fahrzeug schaust.", "PLAIN DOWN"];
hint "Fahrzeug erfolgreich gekauft.";
