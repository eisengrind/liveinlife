/* ----------------------------------------------------------------------------
Function: lilc_invoices_fnc_callback_sendInvoice
Scope: private

Description:
    Is the receive function for lilc_invoices_fnc_sendInvoice.

Parameters:
    _unit - The unit who should have payed the given amount <OBJECT>
    _status - Does _unit payed the amount? <BOOL>
    _amount - The amount _unit had payed (or not). <NUMBER>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_status", false, [false]],
    ["_amount", 0, [0]]
];

if (isNull _unit || !([_unit] call lilc_common_fnc_isAlive) || _unit == player) exitWith {};
if (_amount <= 0) exitWith {};

if (_status) then {
    [_amount] call lilc_cash_fnc_add;
    ["STR_lilc_invoices_Script_InvoicePayed" call BIS_fnc_localize] call lilc_ui_fnc_hint;
} else {
    ["STR_lilc_invoices_Script_InvoiceNotPayed" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};
