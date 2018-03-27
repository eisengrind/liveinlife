/* ----------------------------------------------------------------------------
Function: lilc_invoices_fnc_createInvoice
Scope: public

Description:
    Shows the creation menu if player can create a invoice.

Parameters:
    _unit - The target _unit to send a invoice to. <OBJECT>

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
if ((["lilci_paper_F"] call lilc_inventory_fnc_itemCount) <= 0) exitWith {
    ["STR_lilc_invoices_Script_PaperNeeded" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};
if ((["lilci_pen_F"] call lilc_inventory_fnc_itemCount) <= 0) exitWith {
    ["STR_lilc_invoices_Script_PenNeeded" call BIS_fnc_localize, "ERROR"] call lilc_ui_fnc_hint;
};

if (dialog) exitWith {};
if !(createDialog "lilcm_createInvoice") exitWith {};
(findDisplay 2048) setVariable ["lilc_invoices_target", _unit];

lbClear 1500;
{
    if (call compile getText(_x >> "condition")) then {
        private _i = lbAdd [1500, getText(_x >> "displayName")];
        lbSetValue [1500, _i, getNumber(_x >> "amount")];
        lbSetData [1500, _i, getText(_x >> "note")];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgInvoiceTemplates"));

ctrlSetText [1005, "$"];
ctrlSetText [1400, ""];
