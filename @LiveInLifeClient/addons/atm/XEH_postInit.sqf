#include "script_component.hpp"

if (isServer || isDedicated || !(hasInterface || isDedicated)) then {
    [QGVAR(createAccountWithBonus), { _this spawn FUNC(createAccountWithBonus); }] call CBA_fnc_addEventHandler;
    [QGVAR(createAccount), { _this spawn FUNC(createAccount); }] call CBA_fnc_addEventHandler;
    [QGVAR(depositBalance), { _this spawn FUNC(depositBalance); }] call CBA_fnc_addEventHandler;
    [QGVAR(disburseBalance), { _this spawn FUNC(disburseBalance); }] call CBA_fnc_addEventHandler;
};
