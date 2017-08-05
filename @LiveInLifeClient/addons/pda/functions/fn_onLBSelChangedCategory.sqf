
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;

	private _currentSelection = (lbCurSel 2100);
	if (_currentSelection <= -1) throw false;

	private _data = (lbData [2100, _currentSelection]);
	if (_data == "") throw false;

	if !([(["pda", ([_data, "read"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) throw false;

	ctrlSetText [1008, ""];
	((findDisplay 1642) displayCtrl 1100) ctrlSetStructuredText parseText "";

	lbClear 1501;
	private _index = (lbAdd [1501, "lade..."]);
	lbSetData [1501, _index, ""];

	[[player, (lilc_pda_currentAccountData select 0), _data], "lils_pda_fnc_getEntries"] call lilc_common_fnc_sendToServer;
}
catch
{
	_exception;
};
