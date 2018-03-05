/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canFlipVehicle
Scope: private

Description:
    Checks if _vehicle can be flipped.

Parameters:
    _vehicle - The vehicle to be flipped <OBJECT>

Returns:
    true or false whether _vehicle can be flipped. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

(
    !lilc_action_active &&
    !(isNull _vehicle) &&
    ((count (crew _vehicle)) <= 0) &&
    ([_vehicle] call lilc_keys_fnc_have) &&
    ((_vehicle getVariable ["lilc_flipTimestamp", time]) <= time) &&
    !(missionNamespace getVariable ["lilc_actions_disableFlipVehicle", false])
)
