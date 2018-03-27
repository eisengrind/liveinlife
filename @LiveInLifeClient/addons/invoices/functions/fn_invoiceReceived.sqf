/* ----------------------------------------------------------------------------
Function: lilc_invoices_fnc_invoiceReceived
Scope: private

Description:
    Is the received function which was called after lilc_invoices_fnc_sendInvoice;

Parameters:
    _issuer - The _issuer who created the invoice. <OBJECT>
    _amount - The price of the given invoice. <NUMBER>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

if !(canSuspend) exitWith {
    _this spawn lilc_invoices_fnc_invoiceReceived;
};

_this params [
    ["_issuer", objNull, [objNull]],
    ["_amount", 0, [0]],
    ["_note", "", [""]]
];

if (_amount <= 0) exitWith {};

private _result = [
    format["STR_lilc_invoices_Script_InvoiceMessage" call BIS_fnc_localize, "$", _amount, _note],
    "STR_lilc_invoices_Script_InvoiceHeader" call BIS_fnc_localize,
    (if ([_amount] call lilc_cash_fnc_have) then {
        "STR_lilc_invoices_Script_InvoiceAccept" call BIS_fnc_localize;
    } else {
        false;
    }),
    "STR_lilc_invoices_Script_InvoiceRefuse" call BIS_fnc_localize
] call BIS_fnc_guiMessage;

if (_result) then {
    if !([_amount] call lilc_cash_fnc_remove) then {
        _result = false;
        ["STR_lilc_invoices_Script_InvoiceCouldntPayed" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
    } else {
        ["STR_lilc_invoices_Script_InvoicePayed" call BIS_fnc_localize] call lilc_ui_fnc_hint;
    };
} else {
    ["STR_lilc_invoices_Script_InvoiceCouldntPayed" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};

[[player, _result, _amount], "lilc_invoices_fnc_callback_sendInvoice", _issuer] call lilc_common_fnc_send;
