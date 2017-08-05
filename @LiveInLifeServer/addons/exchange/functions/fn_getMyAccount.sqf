
params [
	["_unit", objNull, [objNull]],
	["_exchangeName", "", [""]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	
	private _exchangeConfig = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;

	private _accountID = (_unit getVariable ["lilc_accountID", 0]);

	private _accountBalance = ([(format["SELECT balance FROM exchange_accounts WHERE accountID = '%1' LIMIT 1", _accountID])] call lils_database_fnc_fetchObjects);
	if ((count _accountBalance) <= 0) throw false;
	_accountBalance = (_accountBalance select 0);

	if ((count _accountBalance) != 1) throw false;
	_accountBalance = (_accountBalance select 0);

	private _lastActions = ([(format[
		"SELECT classname, type, QUOTE(FROM_UNIXTIME(`timestampadded`, '%1d.%1m.%1Y %1H:%1i:%1s')) FROM exchange_logs WHERE accountID = '%2' AND exchangeName = '%3' AND active = '1' ORDER BY timestampadded DESC LIMIT 20",
		"%",
		_accountID,
		(str _exchangeName)
	])] call lils_database_fnc_fetchObjects);
	
	[["account", [_accountBalance, _lastActions]], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
}
catch
{
	_exception;
};
