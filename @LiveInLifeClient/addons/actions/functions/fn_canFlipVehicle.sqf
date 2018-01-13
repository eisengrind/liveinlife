
/*
    Author(s):
        Vincent Heins
    
    Description:
        Checks if the given vehicle object should or can be flipped.
    
    Parameter(s):
        (_this select 0) : _vehicle : <objNull> : Vehicle to flip
    
    Result:
        <bool> : can the vehicle be flipped?

    Example(s):
        (Example 1)
        private _vehicle = objNull;
        private _canFlip = ([_vehicle] call lilc_actions_fnc_canFlipVehicle);
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (
    lilc_action_active ||
    (isNull _vehicle) ||
    ((count (crew _vehicle)) > 0) ||
    !([_vehicle] call lilc_keys_fnc_have) ||
    ((_vehicle getVariable ["lilc_flipTimestamp", time]) > time) ||
    (missionNamespace getVariable ["lilc_actions_disableFlipVehicle", false])
) exitWith { false; };
true;
