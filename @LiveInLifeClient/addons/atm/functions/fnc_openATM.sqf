#include "..\script_component.hpp"

params [
    ["_bankAlias", "", [""]]
];

private _bankCfg = (missionConfigFile >> "CfgBanks" >> _bankAlias);
if (isNull _bankCfg) exitWith {};

createDialog QGVAR(atm);
DIALOG_ATM_DISPLAY setVariable [QGVAR(bank), _bankAlias];

private _bg = getText(_bankCfg >> "background");

if (_bg == "") then {
    DIALOG_ATM_BACKGROUND ctrlSetText _bg;
};

[QGVAR(selectAccountsPage)] call CBA_fnc_localEvent;
