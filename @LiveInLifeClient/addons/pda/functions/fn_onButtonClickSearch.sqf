
try
{
	private _searchedName = (ctrlText 1400);
	
	if (_searchedName == "") then
	{
		["Du hast nichts eingegeben.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	if ((count _searchedName) < 4) then
	{
		["Du musst mindestens 4 Zeichen angeben.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};
	
	private _firstname = _searchedName;
	private _lastname = "";

	if ([_searchedName, " "] call KRON_StrInStr) then
	{
		private _splitted = (_searchedName splitString " ");
		_firstname = (_splitted select 0);
		_lastname = (_splitted select 1);
	};

	lbClear 1500;
	private _index = (lbAdd [1500, "Suche in Datenbank..."]);
	lbSetData [1500, _index, "[]"];

	[
		[player, _firstname, _lastname],
		"lils_pda_fnc_getSearchResults"
	] call lilc_common_fnc_sendToServer;
}
catch
{
	_exception;
};
