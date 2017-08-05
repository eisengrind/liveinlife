
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	private _uiGroup = (ctrlParentControlsGroup _control);
	lbClear (_uiGroup controlsGroupCtrl 1500);
	if ((lbCurSel (_uiGroup controlsGroupCtrl 2101)) > -1) then
	{
		call lilc_exchange_fnc_addOffer_updateInventory;
	};

	private _currentData = (_control lbValue _index);
	if !(_currentData in [0, 1]) throw false;

	if (_currentData == 1) then
	{
		(_uiGroup controlsGroupCtrl 1014) ctrlSetText "Verfügbare Items:";
	}
	else
	{
		(_uiGroup controlsGroupCtrl 1014) ctrlSetText "Inventar:";
	};
}
catch
{
	_exception;
};
