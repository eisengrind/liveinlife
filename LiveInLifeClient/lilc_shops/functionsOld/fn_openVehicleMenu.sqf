
_shopName = param [0, "", [""]];
if (_shopName == "") exitWith {};

disableSerialization;
if !(isClass (missionConfigFile >> "CfgVehicleShops" >> _shopName)) exitWith {};
if (!dialog) then { createDialog "shop_vehicles_menu"; };

waitUntil { !isNull (findDisplay 1240) };
lilc_shopVehicles_escapeEventHandler = (findDisplay 1240) displayAddEventHandler ["KeyDown", { if ((_this select 1) == 1) then { true; }; }];

lilc_shopVehicles_currentShop = _shopName;
_groups = getArray (missionConfigFile >> "CfgVehicleShops" >> _shopName >> "groups");
if !((lilc_player_faction select 0) in _groups) exitWith {};

_vehicles = ("((player_group select 0) in (getArray (_x >> ""groups"")))" configClasses (missionConfigFile >> "CfgVehicleShops" >> _shopName >> "vehicles"));
if ((count _vehicles) <= 0) exitWith {};

if !(isClass (missionConfigFile >> "CfgStaticCameras" >> format["%1__%2", _shopName, (configName (_vehicles select 0))])) exitWith {};
lilc_shopVehicles_camera = [format["%1__%2", _shopName, (configName (_vehicles select 0))], 0] call lilc_common_fnc_createStaticCamera;
if (isNull lilc_shopVehicles_camera) exitWith {};

_ui = (findDisplay 1240);
_uiArrowLeft = (_ui displayCtrl 1243);
_uiArrowRight = (_ui displayCtrl 1244);

if ((count _vehicles) < 1) then {
    _uiArrowLeft ctrlEnable false;
    _uiArrowRight ctrlEnable false;
} else {
    _uiArrowLeft ctrlEnable true;
    _uiArrowRight ctrlEnable true;
};

lilc_shopVehicles_vehicleIndex = 0;
call lilc_shops_fnc_updateVehicleMenu;
