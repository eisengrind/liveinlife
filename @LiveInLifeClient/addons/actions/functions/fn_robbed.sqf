
/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_robbed
Scope: private

Description:
    Is the callback to player from _robber by lilc_actions_fnc_doRobPerson.

Parameters:
    _robber(required) - The unit who robbed player. <OBJECT>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_robber", objNull, [objNull]]
];

[[(player getVariable ['lilc_cash_balance', 0])], "lilc_cash_fnc_add", _robber] call lilc_common_fnc_send;
[0] call lilc_cash_fnc_set;
