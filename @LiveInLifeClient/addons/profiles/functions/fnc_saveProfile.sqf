#include "..\script_component.hpp"

params ["_unit"];

private _pos = getPosASL _unit;

[
    _unit getVariable [QGVAR(profileID), 0],
    [
        ["inventory", ([_unit] call EFUNC(inventory,getInventory)) call EFUNC(inventory,unitInventoryToJSON)],
        ["position_x", _pos select 0],
        ["position_y", _pos select 1],
        ["position_z", _pos select 2],
        ["hunger", _unit getVariable [QEGVAR(food,hunger), 0]],
        ["thirst", _unit getVariable [QEGVAR(food,thirst), 0]],
        ["respawn_timeout", _unit getVariable [QGVAR(respawnTimeout), 0]],
        ["direction", getDir _unit],
        ["variables", nil]
    ]
] call EFUNC(api_profiles,setProfile);

/*

inventory
(virtual inventory)

position_x
position_y
position_z
hunger
thirst

(health)

respawn_timeout

variables

*/
