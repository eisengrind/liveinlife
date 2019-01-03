#include "script_component.hpp"

if (isServer || isDedicated || !(hasInterface || isDedicated)) then {
    [QGVAR(saveProfile), { _this spawn FUNC(saveProfile); }] call CBA_fnc_addEventHandler;

    [QEGVAR(login,beforeProfileLoggedIn), {
        params ["_unit", "_profileID"];

        _unit setVariable [QGVAR(profileID), _profileID, true];
    }] call CBA_fnc_addEventHandler;
};
