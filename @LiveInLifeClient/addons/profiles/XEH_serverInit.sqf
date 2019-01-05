#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    if !(_unit getVariable [QEGVAR(login,finished), false]) exitWith {};

    TARGET_ENDPOINT_CBA_EVENT(QGVAR(saveProfile),[ARR_1(_unit)]);

    deleteVehicle _unit;
    true;
}];
