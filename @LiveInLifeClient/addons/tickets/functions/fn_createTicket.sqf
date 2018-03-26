/* ----------------------------------------------------------------------------
Function: lilc_tickets_fnc_createTicket
Scope: public

Description:
    Shows the creation menu if player can create a ticket.

Parameters:
    _unit - The target _unit to send a ticket to. <OBJECT>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || !([_unit] call lilc_common_fnc_isAlive)) exitWith {};
if (isNull player || !([player] call lilc_common_fnc_isAlive)) exitWith {};
if ((["lilci_tickets_paper_F"] call lilc_inventory_fnc_itemCount) <= 0) exitWith {
    ["STR_lilc_tickets_Script_PaperNeeded" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};
if ((["lilci_tickets_pen_F"] call lilc_inventory_fnc_itemCount) <= 0) exitWith {
    ["STR_lilc_tickets_Script_PenNeeded" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};

if (dialog) exitWith {};
if !(createDialog "lilcm_createTicket") exitWith {};
(findDisplay 2048) setVariable ["lilc_tickets_target", _unit];

lbClear 1500;
{
    if (call compile getText(_x >> "condition")) then {
        private _i = lbAdd [1500, getText(_x >> "displayName")];
        lbSetValue [1500, _i, getNumber(_x >> "amount")];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgTicketTemplates"));

ctrlSetText [1005, "$"];
ctrlSetText [1400, ""];
