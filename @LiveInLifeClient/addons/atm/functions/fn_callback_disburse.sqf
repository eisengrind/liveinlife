/* ----------------------------------------------------------------------------
Function: lilc_atm_fnc_callback_disburse
Scope: private

Description:
    Is the callback function of the atm disburse function.

Parameters:
    _status - The received status of the disburse request. <BOOL>
    _value - The amount of cash to be set on the player. <NUMBER>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_status", false, [false]],
    ["_value", 0, [0]]
];

if (_status) then {
    lilc_atm_currentBankAccount set [2, (lilc_atm_currentBankAccount select 2) - _value];
    [_value] call lilc_cash_fnc_add;
    ["disburse_completed"] call lilc_atm_fnc_selectMenu;
} else {
    ["disburse_failed"] call lilc_atm_fnc_selectMenu;
};
