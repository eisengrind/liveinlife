
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;

	private _data = "";
	_data = (lbData [2100, (lbCurSel 2100)]);
	if (_data == "") throw false;
    ctrlEnable [1604, false];

	if !([(["pda", ([_data, "remove"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) throw false;

	private _currentSelectionList = (lbCurSel 1501);
	if (_currentSelectionList <= -1) throw false;

	_value = (call compile (lbValue [1501, _currentSelectionList]));
	if (isNil "_value") throw false;

	ctrlSetText [1008, ""];
	ctrlSetText [1100, ""];

	lbDelete [1501, _currentSelectionList];

	[
		[player, _value],
		"lils_pda_fnc_removeEntry"
	] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	if !(_exception) then
	{
		ctrlEnable [1604, true];
	};

	_exception;
};
