/* ----------------------------------------------------------------------------
Function: lilc_atm_fnc_createAccount
Scope: private

Description:
    Simply leads to the creation menu of the atm.

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

private _fID = (player getVariable ["lilc_factionID", -1]);
private _banks = [];
if (_fID > 0) then {
    _banks = getArray(([_fID] call lilc_factions_fnc_getFactionConfig) >> "bank_createable");
};
if (!(lilc_atm_currentBankName in _banks) && _fID > 0) exitWith {
    ["Du kannst kein Konto erstellen.", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1522, false];
[
    [
        player,
        lilc_atm_currentBankName
    ],
    "lils_atm_fnc_createAccount"
] call lilc_common_fnc_sendToServer;
