#include "script_component.hpp"

if (isServer || isDedicated || !(hasInterface || isDedicated)) then {
    [QGVAR(initializeUser), { _this spawn FUNC(initializeUser); }] call CBA_fnc_addEventHandler;
    [QGVAR(createUser), { _this spawn FUNC(createUser); }] call CBA_fnc_addEventHandler;
    [QGVAR(profileLogin), { _this spawn FUNC(profileLogin); }] call CBA_fnc_addEventHandler;
    [QGVAR(createProfile), { _this spawn FUNC(createProfile); }] call CBA_fnc_addEventHandler;
};
