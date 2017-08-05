
private _unit = param [0, objNull, [objNull]];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;
	if (player getVariable ["lilc_trade_isTrading", false]) throw false;
	if (_unit getVariable ["lilc_trade_isTrading", false]) throw false;

	throw true;
}
catch
{
	_exception;
};