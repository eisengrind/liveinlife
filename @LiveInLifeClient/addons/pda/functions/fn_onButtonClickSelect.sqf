
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;

	private _currentSelection = (lbCurSel 1500);
	if (_currentSelection <= -1) throw false;

	private _data = (call compile (lbData [1500, _currentSelection]));

	if (isNil "_data") throw false;
	if !(_data isEqualType []) throw false;
	if ((count _data) <= 0) throw false;
	if ((count _data) != 3) throw false;

	lilc_pda_currentAccountData = _data;

	["categories"] call lilc_pda_fnc_selectMenu;

	throw true;
}
catch
{
	_exception;
};
