
try
{
	private _value = (parseNumber (ctrlText 1400));
	if (_value <= 0) throw false;
	if ((lilc_trade_offeredMoney - _value) < 0) then
	{
		["Du kannst nicht so viel Geld entfernen!", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	ctrlSetText [1400, ""];
	lilc_trade_offeredMoney = (lilc_trade_offeredMoney - _value);
	lilc_trade_availableMoney = (lilc_Trade_availableMoney + _value);

	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiTextAvailableMoney = (_ui displayCtrl 1004);
	private _uiTextOfferedMoney = (_ui displayCtrl 1005);

	_uiTextAvailableMoney ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'>%1 Dollar</t>", lilc_trade_availableMoney];
	_uiTextOfferedMoney ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'>%1 Dollar</t>", lilc_trade_offeredMoney];

	[lilc_trade_tradePartner] call lilc_trade_fnc_getOfferTradePartner;
	
	throw true;
}
catch
{
	_exception;
};
