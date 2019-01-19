#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(headlessClients) = [];

if (isDedicated || isServer) then {
    [QGVAR(headlessClientConnected), FUNC(handleHCConnected)] call CBA_fnc_addEventHandler;
};

ADDON = true;
