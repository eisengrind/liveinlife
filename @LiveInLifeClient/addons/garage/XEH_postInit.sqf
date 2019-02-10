#include "script_component.hpp"

if IS_HEADLESS then {
    [QGVAR(transferVehicle), { _this spawn FUNC(transferVehicle); }] call CBA_fnc_addEventHandler;
    [QGVAR(revealVehicle), { _this spawn FUNC(revealVehicle); }] call CBA_fnc_addEventHandler;
};
