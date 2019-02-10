#include "..\script_component.hpp"

params [
    ["_garageAlias", "", [""]]
];

private _garageCfg = GARAGE_CONFIG(_garageAlias);
if (isNull _garageCfg) exitWith {};
if (createDialog QGVAR(garage)) exitWith {};

DISPLAY_GARAGE setVariable [QGVAR(garageAlias), _garageAlias];
