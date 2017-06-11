
params [
	["_exchangeName", "", [""]]
];

try
{
	if (isNull (call lilc_exchange_fnc_getExchangeConfig)) throw false;
	if !(createDialog "lilcm_exchange") throw false;

	lilc_exchange_currentExchange = _exchangeName;

	["dashboard"] call lilc_exchange_fnc_selectMenu;
}
catch
{

};
