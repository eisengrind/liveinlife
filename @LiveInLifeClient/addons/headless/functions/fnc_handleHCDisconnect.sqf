#include "..\script_component.hpp"

params ["_object"];

if !(_object in GVAR(headlessClients)) exitWith {};

GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _object);
publicVariable QGVAR(headlessClients);

false;
