/* ----------------------------------------------------------------------------
Function: lilc_invoices_fnc_canCreateInvoice
Scope: public

Description:
    Checks wheter player can create an invoice or not.

Parameters:
    _unit - The target _unit to send an invoice to. <OBJECT>

Returns:
    Whether player can create an invoice for _unit or not. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

(
    !isNull _unit &&
    alive _unit &&
    _unit != player &&
    (["lilci_paper_F"] call lilc_inventory_fnc_itemCount) > 0 &&
    (["lilci_pen_F"] call lilc_inventory_fnc_itemCount) > 0
);
