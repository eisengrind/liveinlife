
try
{
	if (isNull lilc_trade_tradePartner) throw false;
	if !(isPlayer lilc_trade_tradePartner) throw false;

	[[player], "lilc_trade_fnc_getOfferTradePartner", lilc_trade_tradePartner] call lilc_common_fnc_send;
	throw true;
}
catch
{
	_exception;
};
