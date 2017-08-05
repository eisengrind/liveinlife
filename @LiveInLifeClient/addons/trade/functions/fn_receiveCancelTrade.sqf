
try
{
	if (isNull lilc_trade_tradePartner) throw false;
	if !(isPlayer lilc_trade_tradePartner) throw false;

	closeDialog 1640;

	lilc_trade_tradePartner = objNull;
	lilc_trade_availableMoney = 0;
	lilc_trade_offeredMoney = 0;
	lilc_trade_tradePartner_offeredMoney = 0;
	player setVariable ["lilc_trade_isTrading", false, true];
	player setVariable ["lilc_trade_accepted", false, true];
}
catch
{
	_exception;
};
