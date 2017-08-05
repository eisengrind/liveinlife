
private _unit = param [0, objNull, [objNull]];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;

	disableSerialization;
	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;
	
	private _uiListMyOffers = (_ui displayCtrl 1502);
	private _offeredMoney = lilc_trade_offeredMoney;

	private _offeredItems = [];
	for "_i" from 0 to ((lbSize _uiListMyOffers) - 1) do {
		_offeredItems pushBack (_uiListMyOffers lbData _i);
	};

	[[_offeredMoney, _offeredItems], "lilc_trade_fnc_setOfferTradePartner", _unit] call lilc_common_fnc_send;
	throw true;
}
catch
{
	_exception;
};
