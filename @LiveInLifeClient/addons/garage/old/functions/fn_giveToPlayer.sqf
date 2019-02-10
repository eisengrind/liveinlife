
private _aID = (lbValue [2401, (lbCurSel 2401)]);
if (_aID <= 0) exitWith
{
    [
        "Diese Person ist Offline.",
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

private _vD = (lbData [1500, (lbCurSel 1500)]);
if (_vD == "") exitWith {};

_vD = (call compile _vD);

private _target = (playableUnits select { ((_x getVariable ["lilc_accountID", 0]) isEqualTo _aID);});
if ((count _target) <= 0) exitWith
{
    [
        "Diese Person ist Offline.",
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

_target = (_target select 0);
private _d = (lbData [1500, (lbCurSel 1500)]);
diag_log str _d;
_d = call compile _d;
if ((count _d) <= 0) exitWith {};

[
    [player, (_d select 0), lilc_garage_currentGarage, _target],
    "lils_garage_fnc_giveToPlayer"
] call lilc_common_fnc_sendToServer;

closeDialog 0;
