
params [
	["_offeredMoney", 0, [0]],
	["_offeredItems", [], []]
];

try
{
	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	if (lilc_trade_accepted) then
	{ 
		call lilc_trade_fnc_enableMostControls;
	};

	lilc_trade_tradePartner_offeredMoney = _offeredMoney;

	private _uiListOfferTradePartner = (_ui displayCtrl 1501);
	private _uiTextOfferedMoneyTradePartner = (_ui displayCtrl 1007);

	_uiTextOfferedMoneyTradePartner ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium' size=0.8>%1 Dollar</t>", _offeredMoney];

	lbClear _uiListOfferTradePartner;
	{
		private _classname = _x;
		private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

		if !(isNull _itemConfig) then
		{
			private _index = (_uiListOfferTradePartner lbAdd format["%1", getText(_itemConfig >> "displayName")]);
			_uiListOfferTradePartner lbSetData [_index, _classname];
			_uiListOfferTradePartner lbSetPicture [_index, getText(_itemConfig >> "picture")];
		};
	} forEach _offeredItems;
}
catch
{
	_exception;
};
