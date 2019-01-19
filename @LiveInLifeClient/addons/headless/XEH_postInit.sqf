#include "script_component.hpp"

if (isDedicated || isServer) then {
    addMissionEventHandler ["HandleDisconnect", { _this call FUNC(handleHCDisconnect); }];
} else {
    if !(hasInterface || isDedicated) then {
        [QGVAR(headlessClientConnected), [player]] call CBA_fnc_serverEvent;
    };
};
