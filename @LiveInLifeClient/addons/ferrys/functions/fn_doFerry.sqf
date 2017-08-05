
private _from = lilc_ferrys_currentFerryHarbor;
private _cS = (lbCurSel 1500);
if (_cS <= -1) exitWith {};
private _posC = (getPosASL player);

private _dat = (call compile (lbData [1500, _cS]));
private _to = (_dat select 0);
private _time = (_dat select 1);

private _cfgF = (missionConfigFile >> "CfgFerrys" >> lilc_ferrys_currentFerryHarbor);
if (isNull _cfgF) exitWith {};

private _cfgT = (missionConfigFile >> "CfgFerrys" >> _to);
if (isNull _cfgT) exitWith {};

[
	600,
	"lilc_ferryCounter",
	0.01,
	false
] call lilc_ui_fnc_fadeInTitles;

disableSerialization;
private _ui = (uiNamespace getVariable ["lilc_ferryCounter", displayNull]);
private _uiTextTimeCounter = (_ui displayCtrl 1100);

player setVariable ["lilc_ferry_isWaiting", true, true];

closeDialog 0;

private _sDT = daytime;
_sT = _time;
if (_time < _sDT) then
{
	_time = _time + 24;
};

while
{
	([player] call lilc_common_fnc_isAlive) &&
	(player getVariable ["lilc_ferry_isWaiting", false]) &&
	(_posC distance player < 30)
}
do
{
	if (_sDT > _sT && daytime < _sT) then
	{
		_sDT = 0;
		_time = (_time - 24);
	};
	if (daytime > _time) exitWith {};

	_uiTextTimeCounter ctrlSetStructuredText parseText format[
		"<t font='PuristaMedium'><t size='1.1' align='center'>Waiting for ferry to %1:</t><br /><t align='center' size='3.2'>%2</t></t>",
		getText(_cfgT >> "displayName"),
		([(_time - daytime)] call BIS_fnc_timeToString)
	];

	sleep 0.01;
};



if ((_posC distance player > 30)) exitWith
{
	[600] call lilc_ui_fnc_fadeOutTitles;
	["Du hast den Wartebereich verlassen.", "ERROR"] call lilc_ui_fnc_hint;
	player setVariable ["lilc_ferry_isWaiting", false, true];
};

if !([player] call lilc_common_fnc_isAlive) exitWith
{
	[600] call lilc_ui_fnc_fadeOutTitles;
	player setVariable ["lilc_ferry_isWaiting", false, true];
};

if !(player getVariable ["lilc_ferry_isWaiting", false]) exitWith
{
	[600] call lilc_ui_fnc_fadeOutTitles;
	["Du hast das warten abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
};

[2] call lilc_ui_fnc_fadeInBlack;
sleep 0.5;
[600] call lilc_ui_fnc_fadeOutTitles;
sleep 3.05;

private _posF = ([getText(_cfgF >> "position")] call lilc_common_fnc_getDynamicPosition);
private _posFV = ([getText(_cfgF >> "positionVehicle")] call lilc_common_fnc_getDynamicPosition);

private _posT = ([getText(_cfgT >> "position")] call lilc_common_fnc_getDynamicPosition);
private _posTV = ([getText(_cfgT >> "positionVehicle")] call lilc_common_fnc_getDynamicPosition);

private _distTo = ((_posF select 0) distance (_posT select 0));

_uiTextTimeCounter ctrlSetStructuredText parseText "";

if !([player, "lilci_ferryTicket_F"] call lilc_inventory_fnc_remove) exitWith
{
	[1] call lilc_ui_fnc_fadeOutBlack;
	["Du hast keine Fahrkarte.", "ERROR"] call lilc_ui_fnc_hint;
	[600] call lilc_ui_fnc_fadeOutTitles;
};

private _pV = (vehicle player);

if (_pV isKindOf "Man") then
{
	[_pV, _posT] call lilc_common_fnc_setPosition;
}
else
{
	private _pVC = (crew _pV);
	private _i = -1;
	{
		if (_x getVariable ["lilc_ferry_isWaiting", false]) exitWith
		{
			_i = _forEachIndex;
		};
	} forEach _pVC;

	if (_i <= -1) exitWith {};

	if ((_pVC select _i) isEqualTo player) then
	{
		private _p = ([ASLToAGL (_posT select 0), 8, 60, 1, 0, 0, 0, [], [ASLToAGL (_posT select 0), ASLToAGL (_posT select 0)]] call BIS_fnc_findSafePos);
		_pV setPos _p;
		_pV engineOn false;
	};
};

player setVariable ["lilc_ferry_isWaiting", false, true];
[3] call lilc_ui_fnc_fadeOutBlack;

[(format["Du bist in %1 angekommen.", getText(_cfgT >> "displayName")])] call lilc_ui_fnc_hint;
