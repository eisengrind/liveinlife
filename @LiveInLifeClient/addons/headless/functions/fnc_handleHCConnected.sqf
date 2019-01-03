#include "..\script_component.hpp"

params ["_headlessClient"];

if (_headlessClient in GVAR(headlessClients)) exitWith {};

GVAR(headlessClients) pushBack _headlessClient;
publicVariable QGVAR(headlessClients);
