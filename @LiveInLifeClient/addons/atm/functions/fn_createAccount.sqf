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

private _banks = [];
if (!(lilc_atm_currentBankName in _banks)) exitWith {
    ["Du kannst kein Konto erstellen.", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1522, false];
[
    [
        player,
        lilc_atm_currentBankName
    ],
    "lils_atm_fnc_createAccount"
] call lilc_common_fnc_sendToServer;
