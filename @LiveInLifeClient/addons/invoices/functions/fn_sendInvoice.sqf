/* ----------------------------------------------------------------------------
Function: lilc_invoices_fnc_sendInvoice
Scope: public

Description:
    Sends an invoice with _amount to _unit.

Parameters:
    _unit - The unit to send an invoice to. <OBJECT>
    _amount - The price of the invoice. <NUMBER>
    _note - An additional note connected to the invoice <STRING>

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
    ["_amount", 0, [0]],
    ["_note", "", [""]]
];

if (isNull _unit || !([_unit] call lilc_common_fnc_isAlive) || _unit == player) exitWith {};
if (_amount <= 0) exitWith {};

closeDialog 2048;

[[player, _amount, _note], "lilc_invoices_fnc_invoiceReceived", _unit] call lilc_common_fnc_send;
["STR_lilc_invoices_Script_InvoiceSend" call BIS_fnc_localize] call lilc_ui_fnc_hint;
