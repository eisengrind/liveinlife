/* ----------------------------------------------------------------------------
Function: lilc_tickets_fnc_onLBSelChanged_templates
Scope: private

Description:
    Is called everytime the combobox selection changed.

Parameters:
    _control - The given control control. <CONTROL>
    _index - The given control index. <NUMBER>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

disableSerialization;
params [
    "_control",
    "_index"
];

if (_index <= -1) exitWith {};

ctrlSetText [1400, (_control lbValue _index)];
