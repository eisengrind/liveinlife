/* ----------------------------------------------------------------------------
Function: lilc_tickets_fnc_canCreateTicket
Scope: public

Description:
    Checks wheter player can create a ticket or not.

Parameters:
    _unit - The target _unit to send a ticket to. <OBJECT>

Returns:
    Whether player can create a ticket for _unit or not. <BOOL>

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
    (["lilci_tickets_paper_F"] call lilc_inventory_fnc_itemCount) > 0 &&
    (["lilci_tickets_pen_F"] call lilc_inventory_fnc_itemCount) > 0
);
