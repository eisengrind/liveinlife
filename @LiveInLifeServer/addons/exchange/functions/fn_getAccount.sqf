
params [
	["_unit", objNull, [objNull]],
	["_exchangeName", "", [""]]
];

private _cfgExchange = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
if (isNull _cfgExchange) exitWith {};

private _accountID = (_unit getVariable ["lilc_accountID", 0]);

//[_balance, _storage, _offers]

private _result = [];

private _res = ([(format["SELECT balance FROM exchange_accounts WHERE accountID = '%1' LIMIT 1", _accountID])] call lils_database_fnc_fetchObjects);
_result set [
	0,
	(if ((count _res) <= 0) then { 0; } else { ((_res select 0) select 0); })
];

_result set [
	1,
	([(format[
		"SELECT classname, amount FROM exchange_storages WHERE exchangeName = '%1' AND accountID = '%2' AND amount > 0",
		(str _exchangeName),
		_accountID
	])] call lils_database_fnc_fetchObjects)
];

_result set [
	2,
	([(format["SELECT `classname`, `amount`, `price`, QUOTE(FROM_UNIXTIME(`timestampcreated`, '%3d.%3m.%3Y')), `id`, `type` FROM EXCHANGE_OFFERS WHERE ACCOUNTID = '%1' AND exchangeName = '%2'",
		_accountID,
		(str _exchangeName),
		"%"
	])] call lils_database_fnc_fetchObjects)
];

[[nil, "account_setAccount", _result], "lilc_exchange_fnc_openMenu", player] call lilc_common_fnc_send;
