
params [
	["_shopName", "", [""]]
];

if (_shopName == "") exitWith {};

private _config = (missionConfigFile >> "CfgVehicleShops" >> _shopName);
if (isNull _config) exitWith {};

private _fID = (player getVariable ["lilc_factionID", -1]);
if (((count getArray(_config >> "groups")) > 0 && !(_fID in getArray(_config >> "groups")))) exitWith {};

if !(createDialog "lilcm_shops_vehicles") exitWith {};

disableSerialization;
private _ui = (findDisplay 1700);
private _uiListVehicles = (_ui displayCtrl 1500);

ctrlSetText [1001, getText(_config >> "displayName")];

ctrlShow [2400, false]; //rent
ctrlShow [2401, false]; //buy
ctrlShow [2300, false];

_ui setVariable ["lilc_shopName", _shopName];

{
	private _groups = (getArray(_x >> "groups"));
	if (
		(((count _groups) <= 0) || (_fID in _groups)) &&
		(getNumber(_x >> "rentBuyPrice") >= 0) &&
		(getNumber(_x >> "buyPrice") >= 0)
	) then
	{
		private _vehCfg = ([(configName _x)] call lilc_common_fnc_getClassnameConfig);
		private _dName = getText(_vehCfg >> "displayName");

		if (getText(_x >> "displayName") != "") then
		{
			_dName = getText(_x >> "displayName");
		};

		private _index = (_uiListVehicles lbAdd _dName);
		_uiListVehicles lbSetData [_index, (configName _x)];
		_uiListVehicles lbSetPicture [_index, getText(_vehCfg >> "picture")];
	};
} forEach ("true" configClasses (_config >> "vehicles"));
//[(typeOf cursorObject), true] call BIS_fnc_crewCount
