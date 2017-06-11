
params [
	["_offerID", 0, [0]]
];

try
{
	if (_offerID <= 0) throw false;

	[[player, "remove", [lilc_exchange_currentExchange, _offerID]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;
	throw true;
}
catch
{
	_exception;
};
