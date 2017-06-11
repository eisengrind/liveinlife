
try
{
	disableSerialization;
	private _ui = (findDisplay 1630);
	if (isNull _ui) throw false;

	private _uiGroup = (_ui displayCtrl 25);

	private _uiComboCategory = (_uiGroup controlsGroupCtrl 2100);
	private _uiComboItem = (_uiGroup controlsGroupCtrl 2101);

	private _uiListSells = (_uiGroup controlsGroupCtrl 1501);

	private _currentExchange = lilc_exchange_currentExchange;
	private _category = (_uiComboCategory lbData (lbCurSel _uiComboCategory));
	private _classname = (_uiComboItem lbData (lbCurSel _uiComboItem));

	if (_category == "") throw false;
	if (_classname == "") throw false;

	private _currentRowIndex = (lnbCurSelRow _uiListSells);
	if (_currentRowIndex <= -1) then
	{
		["Du hast kein Angebot ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _offerID = (_uiListSells lnbValue [_currentRowIndex, 0]);
	private _offerAmount = (_uiListSells lnbValue [_currentRowIndex, 1]);

	if (_offerID <= 0) throw false;
	if (_offerAmount <= 0) throw false;

	private _amount = ([(ctrlText (_uiGroup controlsGroupCtrl 1401))] call lilc_common_fnc_textToNumber);
	if (_amount > _offerAmount) then
	{
		["So viele Gegenstände werden bei diesem Angebot nicht verkauft.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	if (([player, _classname] call lilc_inventory_fnc_itemCountContainers) < _amount) then
	{
		["Du besitzt nicht genügend Gegenstände.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	[[player, "sell", [_currentExchange, _offerID, _amount]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	_exception;
};
