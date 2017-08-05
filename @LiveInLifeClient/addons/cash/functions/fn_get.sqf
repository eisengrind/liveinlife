
params [
	["_unit", player, [ObjNull]]
];

try
{
	if (isNull _unit || !isPlayer _unit) throw 0;

	if (_unit isEqualTo player) then
	{
		throw lilc_player_cash;
	}
	else
	{
		lilc_tmpMoneyResult = nil;
		[[player], "lilc_cash_fnc_getReceived", _unit] call lilc_common_fnc_send;

		waitUntil
		{
			!isNil "lilc_tmpMoneyResult"
		};

		throw lilc_tmpMoneyResult;
	};
} catch {
	_exception;
};
