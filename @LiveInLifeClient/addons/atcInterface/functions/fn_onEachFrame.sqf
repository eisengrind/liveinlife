/* ----------------------------------------------------------------------------
Function: lilc_atcInterface_fnc_onEachFrame
Scope: private

Description:
    Updates the positions of the planes map control.

Parameters:
    -

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

disableSerialization;
private _ui = (findDisplay 1420);
private _uiMap = (_ui displayCtrl 1000);
{
    private _control = _x;
    _control ctrlSetPosition (_uiMap ctrlMapWorldToScreen (_control getVariable ["lilc_control_position", []]));
    _control ctrlCommit 0;
} forEach lilc_atcInterface_controls;
