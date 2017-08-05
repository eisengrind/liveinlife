
try
{
	disableSerialization;
	private _ui = (findDisplay 1630);
	if (isNull _ui) throw false;

	private _uiGroup = (_ui displayCtrl 26);
	private _uiComboType = (_uiGroup controlsGroupCtrl 2100);
	private _uiEditAmount = (_uiGroup controlsGroupCtrl 1400);
	private _uiEditPrice = (_uiGroup controlsGroupCtrl 1401);
	private _uiComboCategory = (_uiGroup controlsGroupCtrl 2101);
	private _uiListInventory = (_uiGroup controlsGroupCtrl 1500);

	private _currentExchange = lilc_exchange_currentExchange;
	private _exchangeConfig = ([_currentExchange] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;


	if ((lbCurSel _uiComboType) <= -1) then
	{
		["Du hast keinen Typ ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _comboTypeValue = (_uiComboType lbValue (lbCurSel _uiComboType));

	if ((lbCurSel _uiComboCategory) <= -1) then
	{
		["Du hast keine Kategorie ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _comboCategoryData = (_uiComboCategory lbData (lbCurSel _uiComboCategory));
	
	private _amount = ([(ctrlText _uiEditAmount)] call lilc_common_fnc_textToNumber);
	private _price = ([(ctrlText _uiEditPrice)] call lilc_common_fnc_textToNumber);

	if ((lbCurSel _uiListInventory) <= -1) then
	{
		["Du hast kein Item ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _item = (_uiListInventory lbData (lbCurSel _uiListInventory));
	private _itemConfig = ([_item] call lilc_common_fnc_getClassnameConfig);
	private _itemAmount = ({ (_x == _item) } count ([player, false] call lilc_inventory_fnc_getAllUnitItems));

	if (isNil "_comboTypeValue") throw false;
	if !(_comboTypeValue in [1, 0]) throw false;

	if (_comboCategoryData == "") throw false;
	if !(isClass (_exchangeConfig >> "categories" >> _comboCategoryData)) throw false;

	if (_amount <= 0) then
	{
		["Du kannst keine negative Anzahl angeben.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	if (_comboTypeValue == 0 && _amount > _itemAmount) then
	{
		["Du hast nicht genügend Gegenstände dabei.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	}
	else
	{
		if (_comboTypeValue == 0) then
		{
			for "_i" from 1 to _amount do
			{
				[player, _item] call lilc_inventory_fnc_remove;
			};
		};
	};

	if (_price < 0) throw false;
	if (_comboTypeValue == 1 && !([_price] call lilc_cash_fnc_have)) then
	{
		["Du hast nicht genügend Bargeld dabei.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	}
	else
	{
		if (_comboTypeValue == 1) then
		{
			if !([player, _price * _amount] call lilc_cash_fnc_remove) then
			{
				["Du hast nicht genügend Bargeld dabei.", "ERROR"] call lilc_ui_fnc_hint;
				throw false;
			};
		};
	};

	if (isNull _itemConfig) then
	{
		["Dieser Gegenstand existiert nicht", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	[[player, _currentExchange, _comboTypeValue, _comboCategoryData, _item, _amount, _price], "lils_exchange_fnc_addOffer"] call lilc_common_fnc_sendToServer;
    call lilc_exchange_fnc_addOffer_updateInventory;

	throw true;
}
catch
{
	_exception;
};
