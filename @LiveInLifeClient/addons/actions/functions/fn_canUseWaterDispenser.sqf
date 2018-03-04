/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canUseWaterDispenser
Scope: private

Description:
    Checks whether player can use a water dispenser or not.

Parameters:
    _object - The object which is the water dispenser. <OBJECT>

Returns:
    true or false whether the player can use given water dispenser. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */


params [
    ["_object", objNull, [objNull]]
];

(
    !(isNull _object) &&
    (simulationEnabled _object) &&
    (["lilc_waterDispenserActive", "BOOL", true] call lilc_common_fnc_getSetting)
);
