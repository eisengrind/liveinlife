/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canRobPerson
Scope: private

Description:
    Checks whether player can rob _target.

Parameters:
    _target - The target to be robbed. <OBJECT>

Returns:
    true or false whether _target can be robbed. <BOOL>

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
        Checks whether a player can rob a _target.

    Parameter(s):
        (_this select 0) : _target : <objNull> : the unit to check

    Result:
        <bool> : can the player rob a person?

    Example(s):
        (Example 1)
        private _canRobPerson = ([player] call lilc_actions_fnc_canRobCorpse);
*/

params [
    ["_target", objNull, [objNull]]
];

(
    !([_target] call lilc_common_fnc_isAlive) ||
    (_target getVariable ["ACE_isUnconscious", false]) ||
    (_target getVariable ["ACE_captives_isSurrendering", false]) ||
    (_target getVariable ["lilc_actions_isBeaten", false]) ||
    (_target getVariable ["ACE_captives_isHandcuffed", false]) ||
    (_target getVariable ["lilc_isDead", false])
);
