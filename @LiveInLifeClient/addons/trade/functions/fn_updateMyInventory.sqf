
try
{
	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiListMyInventory = (_ui displayCtrl 1500);
	private _uiTextAvailableMoney = (_ui displayCtrl 1004);
	private _uiTextOfferedMoney = (_ui displayCtrl 1005);

	_uiTextAvailableMoney ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium' size=0.8>%1 Dollar</t>", lilc_trade_availableMoney];
	_uiTextOfferedMoney ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium' size=0.8>%1 Dollar</t>", lilc_trade_offeredMoney];

	lbClear _uiListMyInventory;
	{
		private _classname = _x;
		private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
		
		if !(isNull _itemConfig) then
		{
			private _index = (_uiListMyInventory lbAdd getText(_itemConfig >> "displayName"));
			_uiListMyInventory lbSetData [_index, _classname];
			_uiListMyInventory lbSetPicture [_index, getText(_itemConfig >> "picture")];
		};
	} forEach ([player, false] call lilc_inventory_fnc_getAllUnitItems);

	throw true;
}
catch
{
	_exception;
};
