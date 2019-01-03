#include "script_component.hpp"

[QGVAR(initializeUser), { _this spawn FUNC(initializeUser); }] call CBA_fnc_addEventHandler;
[QGVAR(createUser), { _this spawn FUNC(createUser); }] call CBA_fnc_addEventHandler;
[QGVAR(profileLogin), {
    params [
        ["_unit", objNull, [objNull]],
        ["_profileID", 0, [0]]
    ];

    [QGVAR(profileReceived), _profileID, _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
[QGVAR(createProfile), { _this spawn FUNC(createProfile); }] call CBA_fnc_addEventHandler;


