
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _control) throw false;
	if (_index <= -1) throw false;

	private _category = (_control lbData _index);
	private _ui = (ctrlParent _control);
	private _uiGroup = (_ui displayCtrl 25);
	private _uiDashboardComboItemSelection = (_uiGroup controlsGroupCtrl 2101);

	private _exchangeConfig = ([lilc_exchange_currentExchange] call lilc_exchange_fnc_getExchangeConfig);

	lnbClear (_uiGroup controlsGroupCtrl 1500);
	lnbClear (_uiGroup controlsGroupCtrl 1501);

	lbClear _uiDashboardComboItemSelection;
	{
		private _itemConfig = ([_x] call lilc_common_fnc_getClassnameConfig);
		if !(isNull _itemConfig) then
		{
			private _index = (_uiDashboardComboItemSelection lbAdd getText(_itemConfig >> "displayName"));
			_uiDashboardComboItemSelection lbSetData [_index, _x];
			_uiDashboardComboItemSelection lbSetPicture [_index, getText(_itemConfig >> "picture")];
		};
	} forEach getArray(_exchangeConfig >> "categories" >> _category >> "items");
}
catch
{
	_exception;
};
