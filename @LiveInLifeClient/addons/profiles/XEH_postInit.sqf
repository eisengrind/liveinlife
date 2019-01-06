#include "script_component.hpp"

if (isServer || isDedicated || !(hasInterface || isDedicated)) then {
    [QGVAR(saveProfile), {
        params ["_unit"];

        private _profileID = _unit getVariable [QGVAR(profileID), 0];

        private _pos = getPosASL _unit;
        private _opts = [
            ["inventory", ([_unit] call EFUNC(inventory,getInventory)) call EFUNC(inventory,unitInventoryToJSON)],
            ["position_x", _pos select 0],
            ["position_y", _pos select 1],
            ["position_z", _pos select 2],
            ["hunger", _unit getVariable [QEGVAR(food,hunger), 0]],
            ["thirst", _unit getVariable [QEGVAR(food,thirst), 0]],
            ["respawn_timeout", _unit getVariable [QGVAR(respawnTimeout), 0]],
            ["direction", getDir _unit],
            ["variables", nil]
        ];

        [_profileID, _opts] spawn FUNC(saveProfile);
    }] call CBA_fnc_addEventHandler;

    [QEGVAR(login,beforeProfileLoggedIn), {
        params ["_unit", "_profileID" "_res"];

        _unit setVariable [QGVAR(profileID), _profileID, true];
        _unit setVariable [QGVAR(new), [_res, "new"] call a3uf_json_fnc_get, true];
    }] call CBA_fnc_addEventHandler;
};
