
params [
	["_from", "", [""]]
];

private _cfgF = (missionConfigFile >> "CfgFerrys" >> _from);
if (isNull _cfgF) exitWith {};

private _rds = getArray(_cfgF >> "rides");
if ((count _rds) <= 0) exitWith {};
if !(createDialog "lilcm_ferry") exitWith {};

disableSerialization;
private _ui = (findDisplay 1706);
if (isNull _ui) exitWith {};

private _uiButtonWaitForFerry = (_ui displayCtrl 2400);

lilc_ferrys_currentFerryHarbor = _from;

_uiButtonWaitForFerry ctrlRemoveAllEventHandlers "ButtonDown";

if !(player getVariable ["lilc_ferry_isWaiting", false]) then
{
	_uiButtonWaitForFerry ctrlSetText "Wait for ferry";
	_uiButtonWaitForFerry ctrlAddEventHandler [
		"ButtonDown",
		{
			(0 spawn lilc_ferrys_fnc_doFerry);
		}
	];
}
else
{
	_uiButtonWaitForFerry ctrlSetText "Stop waiting";
	_uiButtonWaitForFerry ctrlAddEventHandler [
		"ButtonDown",
		{
			disableSerialization;
			private _uiButtonWaitForFerry = ((findDisplay 1706) displayCtrl 2400);
			_uiButtonWaitForFerry ctrlEnable false;
			_uiButtonWaitForFerry ctrlRemoveAllEventHandlers "ButtonDown";
			_uiButtonWaitForFerry ctrlAddEventHandler [
				"ButtonDown",
				{
					(0 spawn lilc_ferrys_fnc_doFerry);
				}
			];
			player setVariable ["lilc_ferry_isWaiting", false, true];
			_uiButtonWaitForFerry ctrlEnable true;
		}
	];
};

if ((["lilci_ferryTicket_F"] call lilc_inventory_fnc_itemCount) <= 0) then
{
	ctrlEnable [2400, false];
};

private _cDT = (daytime + 0.007);

private _rdsH = _rds select { _cDT < (_x select 1) };
private _rdsS = _rds select { _cDT > (_x select 1) };
_rdsH = ([
	_rdsH,
	[],
	{
		(_x select 1)
	},
	"ASCEND"
] call BIS_fnc_sortBy);
_rdsS = ([
	_rdsS,
	[],
	{
		(_x select 1)
	},
	"ASCEND"
] call BIS_fnc_sortBy);

_rds = (_rdsH + _rdsS);
_rds resize 20;

lbClear 1500;
{
	if (_x isEqualType []) then
	{
		private _cfgT = (missionConfigFile >> "CfgFerrys" >> (_x select 0));

		if !(isNull _cfgT) then
		{
			private _index = (lbAdd [1500, (format["%1 - to %2", ([(_x select 1), "HH:MM"] call BIS_fnc_timeToString), getText(_cfgT >> "displayName")])]);
			lbSetData [1500, _index, (str _x)];
		};
	};
} forEach _rds;
