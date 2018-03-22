/* ----------------------------------------------------------------------------
Function: lilc_atm_fnc_callback_getAccount
Scope: private

Description:
    Sets the current bankaccount to given data.

Parameters:
    _bankAccount - The bankaccount data to be set.

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

[_this] params [
    ["_bankAccount", [], [[]]]
];

lilc_atm_currentBankAccount = _bankAccount;
if ((count _bankAccount) > 0) then {
    ["main"] call lilc_atm_fnc_selectMenu;
} else {
    ["main_failed"] call lilc_atm_fnc_selectMenu;
};
