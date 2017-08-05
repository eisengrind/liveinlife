
params [
	["_unit", objNull, [objNull]],
	["_exchangeName", "", [""]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;

	private _exchangeConfig = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;

	
}
catch
{
	_exception;
};
