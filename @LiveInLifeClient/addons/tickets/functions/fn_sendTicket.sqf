/* ----------------------------------------------------------------------------
Function: lilc_tickets_fnc_sendTicket
Scope: public

Description:
    Sends a ticket with _amount to _unit.

Parameters:
    _unit - The unit to send a ticket to. <OBJECT>
    _amount - The price of the ticket.

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
    ["_amount", 0, [0]]
];

if (isNull _unit || !([_unit] call lilc_common_fnc_isAlive) || _unit == player) exitWith {};
if (_amount <= 0) exitWith {};

[[player, _amount], "lilc_tickets_fnc_ticketReceived", _unit] call lilc_common_fnc_send;
["STR_lilc_tickets_Script_TicketSend" call BIS_fnc_localize] call lilc_ui_fnc_hint;
