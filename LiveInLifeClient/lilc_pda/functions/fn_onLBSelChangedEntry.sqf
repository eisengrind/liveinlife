
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;

	private _data = "";
	_data = (lbData [2100, (lbCurSel 2100)]);
	if (_data == "") throw false;

	if !([(["pda", ([_data, "read"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) throw false;

	private _entryID = (lbValue [1501, (lbCurSel 1501)]);

	[[player, _entryID], "lils_pda_fnc_getEntry"] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	_exception;
};
