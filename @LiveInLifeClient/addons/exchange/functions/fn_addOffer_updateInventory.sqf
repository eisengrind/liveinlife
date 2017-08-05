
disableSerialization;
try
{
	private _ui = (findDisplay 1630);
	private _uiGroup = (_ui displayCtrl 26);
	private _uiComboType = (_uiGroup controlsGroupCtrl 2100);
	private _uiComboCategory = (_uiGroup controlsGroupCtrl 2101);
	private _uiInventoryTitle = (_uiGroup controlsGroupCtrl 1014);
	private _index = (lbCurSel _uiComboCategory);
	private _uiListInventory = (_uiGroup controlsGroupCtrl 1500);
	private _exchangeConfig = ([lilc_exchange_currentExchange] call lilc_exchange_fnc_getExchangeConfig);

	private _currentType = (_uiComboType lbValue (lbCurSel _uiComboType));
	if !(_currentType in [0, 1]) throw false;

	private _currentCategory = (_uiComboCategory lbData _index);
	private _categoryItems = getArray(_exchangeConfig >> "categories" >> _currentCategory >> "items");

	lbClear _uiListInventory;
	
	if (_currentType == 0) then
	{
		private _allItems = ([player, false] call lilc_inventory_fnc_getAllUnitItems);

		private _items = [[], []];
		{
			if (_x in _categoryItems) then
			{
				if !(_x in (_items select 0)) then
				{
					private _index = ((_items select 0) pushBack _x);
					(_items select 1) set [_index, 1];
				}
				else
				{
					private _index = ((_items select 0) find _x);
					(_items select 1) set [_index, (((_items select 1) select _index) + 1)];
				};
			};
		} forEach _allItems;

		{
			private _classname = _x;
			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			private _index = (_uiListInventory lbAdd format["%1x %2", ((_items select 1) select _forEachIndex), getText(_itemConfig >> "displayName")]);
			_uiListInventory lbSetData [_index, _classname];
			_uiListInventory lbSetValue [_index, ((_items select 1) select _forEachIndex)];
			_uiListInventory lbSetPicture [_index, getText(_itemConfig >> "picture")];
		} forEach (_items select 0);

		if ((lbSize _uiListInventory) <= 0) then
		{
			private _index = (_uiListInventory lbAdd "Du hast kein passendes Item dabei.");
		};
	}
	else
	{
		{
			private _itemConfig = ([_x] call lilc_common_fnc_getClassnameConfig);

			private _index = (_uiListInventory lbAdd getText(_itemConfig >> "displayName"));
			_uiListInventory lbSetData [_index, _x];
			_uiListInventory lbSetValue [_index, 1];
			_uiListInventory lbSetPicture [_index, getText(_itemConfig >> "picture")];
		} forEach _categoryItems;
	};
}
catch
{
	_exception;
};
