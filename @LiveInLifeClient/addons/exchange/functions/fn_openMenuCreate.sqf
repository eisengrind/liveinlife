
params [
	["_name", lilc_exchange_currentExchange, [""]],
	["_type", "buy", [""]]
];

if (_name == "" || isNil "_name") exitWith {};
lilc_exchange_currentExchange = _name;

disableSerialization;

private _cfg = ([_name] call lilc_exchange_fnc_getExchangeConfig);
if (isNull _cfg) exitWith {};

private _ui = (findDisplay 2303);
if (isNull _ui) then {
	createDialog "lilcm_exchange_create";
};

ctrlSetText [1000, (format["%1 - Angebot erstellen", getText(_cfg >> "displayName")])];

private _uiFrameButtonBuyBackground = (_ui displayCtrl 998);
private _uiFrameButtonSellBackground = (_ui displayCtrl 999);

switch (_type) do
{
	case "buy": {
		ctrlShow [2301, true];
		ctrlShow [2300, false];

		_uiFrameButtonBuyBackground ctrlSetBackgroundColor [0, 0, 0, 0.6];
		_uiFrameButtonSellBackground ctrlSetBackgroundColor [0, 0, 0, 0.2];
		_uiFrameButtonBuyBackground ctrlCommit 0;
		_uiFrameButtonSellBackground ctrlCommit 0;

		lbClear 1501;
		{
			private _itemCfg = ([_x] call lilc_common_fnc_getClassnameConfig);
			private _i = (lbAdd [1501, getText(_itemCfg >> "displayName")]);
			lbSetData [1501, _i, _x];
			lbSetPicture [1501, _i, getText(_itemCfg >> "picture")];
		} forEach getArray(_cfg >> "items");
	};

	case "sell": {
		ctrlShow [2301, false];
		ctrlShow [2300, true];

		_uiFrameButtonBuyBackground ctrlSetBackgroundColor [0, 0, 0, 0.2];
		_uiFrameButtonSellBackground ctrlSetBackgroundColor [0, 0, 0, 0.6];
		_uiFrameButtonBuyBackground ctrlCommit 0;
		_uiFrameButtonSellBackground ctrlCommit 0;

		lbClear 1500;

		lbClear 2100;
		private _i = (lbAdd [2100, "Mein Inventar"]);
		lbSetData [2100, _i, (player call BIS_fnc_netId)];

		{
			if ([_x] call lilc_keys_fnc_have) then
			{
				private _vCfg = ([(typeOf _x)] call lilc_common_fnc_getClassnameConfig);
				private _i = (lbAdd [2100, getText(_vCfg >> "displayName")]);
				lbSetPicture [2100, _i, getText(_vCfg >> "picture")];
				lbSetData [2100, _i, (_x call BIS_fnc_netId)];
			};
		} forEach nearestObjects [(position player), ["Bicycle", "Air", "Ship", "Boat", "Truck", "LandVehicle"], 50, true];

	};
};
