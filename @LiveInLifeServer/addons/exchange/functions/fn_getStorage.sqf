
params [
	["_unit", objNull, [objNull]],
	["_exchangeName", "", [""]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	private _factionID = (_unit getVariable ["lilc_factionID", -1]);
	private _exchangeConfig = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
	if (isNull _exchangeConfig) throw false;

	private _accountID = (_unit getVariable ["lilc_accountID", 0]);

	private _items = ([(format[
		"SELECT classname, amount FROM exchange_storages WHERE exchangeName = '%1' AND accountID = '%2' AND amount > 0",
		(str _exchangeName),
		_accountID

	])/*([
		"exchange_storages",
		[
			["classname"],
			["amount"]
		],
		[
			["exchangeName", (str _exchangeName)],
			["accountID", _accountID]
		]
	] call lils_database_fnc_generateFetchQuery)*/] call lils_database_fnc_fetchObjects);

	[["storage", _items], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
