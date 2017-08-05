
disableSerialization;
params [
	["_uiListMyOffers", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _uiListMyOffers) throw false;
	if (_index <= -1) throw false;

	private _ui = (findDisplay 1640);
	if (isNull _ui) throw false;

	private _uiListMyInventory = (_ui displayCtrl 1502);

	private _classname = (_uiListMyOffers lbData _index);
	private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
	if (isNull _itemConfig) throw false;

	_uiListMyOffers lbDelete _index;

	private _index = _uiListMyInventory lbAdd format["%1", getText(_itemConfig >> "displayName")];
	_uiListMyInventory lbSetData [_index, _classname];
	_uiListMyInventory lbSetPicture [_index, getText(_itemConfig >> "picture")];
	lbSort [_uiListMyInventory, "ASC"];

	[lilc_trade_tradePartner] call lilc_trade_fnc_getOfferTradePartner;

	throw true;
}
catch
{
	_exception;
};
