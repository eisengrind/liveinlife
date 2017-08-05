
private _aID = (lbValue [2402, (lbCurSel 2402)]);
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

[
	[player, (_data select 0), lilc_garage_currentGarage, _target],
	"lils_garage_fnc_giveToPlayer"
] call lilc_common_fnc_sendToServer;

closeDialog 0;
