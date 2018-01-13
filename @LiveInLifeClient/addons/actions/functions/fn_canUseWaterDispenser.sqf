
/*
    Author(s):
        Vincent Heins

    Description:
        Checks if the player is able to use a water dispenser (or any object).

    Parameter(s):
        (_this select 0) : _object : <objNull> : object to check for water "dispension"

    Result:
        <bool> : can the object be used as water dispenser?
    
    Example(s):
        (Example 1)
        private _canUseWaterDispenser = ([player] call lilc_actions_fnc_canUseWaterDispenser);
*/

params [
    ["_object", objNull, [objNull]]
];

(
    !(isNull _object) &&
    (simulationEnabled _object) &&
    (["lilc_waterDispenserActive", "BOOL", true] call lilc_common_fnc_getSetting)
);
