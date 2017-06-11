
disableSerialization;
params [
	["_uiListMyInventory", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _uiListMyInventory) throw false;
	if (_index <= -1) throw false;

	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiListMyOffers = (_ui displayCtrl 1502);

	private _classname = (_uiListMyInventory lbData _index);
	private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
	if (isNull _itemConfig) throw false;

	_uiListMyInventory lbDelete _index;

	private _index = _uiListMyOffers lbAdd format["%1", getText(_itemConfig >> "displayName")];
	_uiListMyOffers lbSetData [_index, _classname];
	_uiListMyOffers lbSetPicture [_index, getText(_itemConfig >> "picture")];
	lbSort [_uiListMyOffers, "ASC"];

	[lilc_trade_tradePartner] call lilc_trade_fnc_getOfferTradePartner;

	throw true;
}
catch
{
	_exception;
};
