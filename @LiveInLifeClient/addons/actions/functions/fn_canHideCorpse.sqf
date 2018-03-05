/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canHideCorpse
Scope: private

Description:
    Checks whether _target corpse can be hided or not.

Parameters:
    _target - The target corpse to be hided. <OBJECT>

Returns:
    true or false whether _target can be hided.

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */
/*
    Author(s):
        Vincent Heins
    
    Description:
        Checks whether a player can hide a corpse or not.

    Parameter(s):
        (_this select 0) : _target : <objNull> : the unit to check

    Result:
        <bool> : can the unit hide the corpse?

    Example(s):
        (Example 1)
        private _canHideCorpse = ([player] call lilc_actions_fnc_canHideCorpse);
*/

params [
    ["_target", objNull, [objNull]]
];

(!([_target] call lilc_common_fnc_isAlive) && !(missionNamespace getVariable ["lilc_actions_disableHideCorpse", false]));
