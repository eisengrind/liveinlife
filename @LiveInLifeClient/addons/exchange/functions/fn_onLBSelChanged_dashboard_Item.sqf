
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _control) throw false;
	if (_index <= -1) throw false;

	private _uiGroup = (ctrlParentControlsGroup _control);
	private _uiComboCategory = (_uiGroup controlsGroupCtrl 2100);

	private _categoryIndex = (lbCurSel _uiComboCategory);
	private _categoryData = (_uiComboCategory lbData _categoryIndex);
	if (_categoryData == "") throw false;

	private _itemData = (_control lbData _index);
	if (_itemData == "") throw false;

	[[player, lilc_exchange_currentExchange, _categoryData, _itemData], "lils_exchange_fnc_getItemOffers"] call lilc_common_fnc_sendToServer;
	throw true;
}
catch
{
	_exception;
};
