#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    if !(_unit getVariable [QEGVAR(login,finished), false]) exitWith {};

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

    TARGET_ENDPOINT_CBA_EVENT(QGVAR(saveProfile),[ARR_2(_profileID,_opts)]);

    deleteVehicle _unit;
    false;
}];
