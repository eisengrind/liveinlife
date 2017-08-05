
/*
    Filename:
        fn_canFlipVehicle.sqf
    Author:
        Vincent Heins
    Description:
        Checks if the given vehicle object should or can be flipped.
    Params:
        (_this select 0) : _vehicle : <objNull> : Vehicle to flip
    Result:
        <bool> : can the vehicle be flipped?
*/

private _vehicle = param [0, objNull, [objNull]];

try {
    if (lilc_action_active) throw false;
    if (isNull _vehicle) throw false;
    if (((vectorUp _vehicle) select 2) > 0.1) throw false;
    if ((_vehicle getVariable ["lilc_flipTimestamp", time]) > time) throw false;
    if (missionNamespace getVariable ["lilc_actions_disableFlipVehicle", false]) throw false;

    throw true;
} catch {
    _exception;
};
