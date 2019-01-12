/* ----------------------------------------------------------------------------
Function: lilc_atm_fnc_createAccount
Scope: private

Description:
    Simply leads to the creation menu of the atm.

Parameters:
    -

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

ctrlEnable [1522, false];
[
    [
        player,
        lilc_atm_currentBankName
    ],
    "lils_atm_fnc_createAccount"
] call lilc_common_fnc_sendToServer;
