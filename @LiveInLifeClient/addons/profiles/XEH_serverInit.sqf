#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    if !(_unit getVariable [QEGVAR(login,finished), false]) exitWith {};

    TARGET_ENDPOINT_CBA_EVENT(QGVAR(saveProfile),[_unit]);

    deleteVehicle _unit;
    false;
}];

FUNC(autoSave) = {
    INFO(QUOTE(autosaving players));
    private _players = ((allPlayers - (entities "HeadlessClient_F")) select {
        (!isNull _x) && (_unit getVariable [QEGVAR(login,finished), false]);
    });
    {
        INFO(format[ARR_2(QUOTE(autosaving player UID: %1),getPlayerUID _x)]);
        TARGET_ENDPOINT_CBA_EVENT(QGVAR(saveProfile),[_x]);
    } foreach _players;
    INFO(format[ARR_2(QUOTE(sent %1 saving states to consumers),count _players)]);

    [FUNC(autoSave), nil, GVAR(autoSaveInterval)] call CBA_fnc_waitAndExecute;
};

[FUNC(autoSave), nil, GVAR(autoSaveInterval)] call CBA_fnc_waitAndExecute;
