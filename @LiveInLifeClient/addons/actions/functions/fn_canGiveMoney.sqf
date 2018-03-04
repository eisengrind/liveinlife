/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canGiveMoney
Scope: private

Description:
    Checks whether player can interact with _unit to give money.

Parameters:
    _unit - The unit to interact with. <OBJECT>

Returns:
    true or false whether player is able to interact with _unit. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

(!(isNull _unit) && (isPlayer _unit));
