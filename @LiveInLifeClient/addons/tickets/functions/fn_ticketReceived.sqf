/* ----------------------------------------------------------------------------
Function: lilc_tickets_fnc_ticketReceived
Scope: private

Description:
    Is the received function which was called after lilc_tickets_fnc_sendTicket;

Parameters:
    _issuer - The _issuer who created the ticket. <OBJECT>
    _amount - The price of the given ticket. <NUMBER>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

if !(canSuspend) exitWith {
    _this spawn lilc_tickets_fnc_ticketReceived;
};

_this params [
    ["_issuer", objNull, [objNull]],
    ["_amount", 0, [0]]
];

if (_amount <= 0) exitWith {};

private _result = [
    format["STR_lilc_tickets_Script_TicketMessage" call BIS_fnc_localize, _amount],
    "STR_lilc_tickets_Script_TicketHeader" call BIS_fnc_localize,
    (if ([_amount] call lilc_cash_fnc_have) then {
        "STR_lilc_tickets_Script_TicketAccept" call BIS_fnc_localize;
    } else {
        false;
    }),
    "STR_lilc_tickets_Script_TicketRefuse" call BIS_fnc_localize
] call BIS_fnc_guiMessage;

if (_result) then {
    if !([_amount] call lilc_cash_fnc_remove) then {
        _result = false;
        ["STR_lilc_tickets_Script_TicketCouldntPayed" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
    };
};

[[player, _result, _amount], "lilc_tickets_fnc_callback_sendTicket", _issuer] call lilc_common_fnc_send;
