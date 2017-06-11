
try
{
	disableSerialization;
	private _ui = (findDisplay 1630);
	private _uiGroup = (_ui displayCtrl 28);
	private _uiGroupListThings = (_uiGroup controlsGroupCtrl 1500);

	private _currentIndex = (lbCurSel _uiGroupListThings);
	if (_currentIndex <= -1) throw false;

	private _classname = (_uiGroupListThings lbData _currentIndex);
	private _amount = (_uiGroupListThings lbValue _currentIndex);

	private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
	if (isNull _itemConfig) throw false;
	if (_amount <= 0) throw false;

	if (isNull ([player, _classname] call lilc_inventory_fnc_canAdd)) then
	{
		["Du hast nicht genügend Platz", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _counter = 0;
	for [{}, { _counter < _amount }, { _counter = _counter + 1 }] do
	{
		if !([player, _classname] call lilc_inventory_fnc_add) exitWith {};
	};

	if (_counter != _amount) then
	{
		["Dein Inventar wurde (zum Teil) gefüllt."] call lilc_ui_fnc_hint;
	}
	else
	{
		["Dein Inventar wurde (komplett) gefüllt."] call lilc_ui_fnc_hint;
	};
	
	[[player, "remove_ware", [lilc_exchange_currentExchange, _classname, _counter]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	_exception;
};
