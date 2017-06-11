
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;
	ctrlEnable [1606, false];

	private _currentSelection = (lbCurSel 2101);
	if (_currentSelection <= -1) then
	{
		["Du hast keine Kategorie ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _currentSelectionData = (lbData [2101, _currentSelection]);
	if !([([_currentSelectionData, "write"] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) throw false;

	private _title = (ctrlText 1401);
	private _description = (ctrlText 1402);
	
	if (_title == "") then
	{
		["Du hast keinen Titel angegeben.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	if (_description == "") then
	{
		["Du hast keine Beschreibung angegeben.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	_description = (_description splitString toString [10]);
	_description = (_description joinString "<br />");

	[
		[player, (lilc_pda_currentAccountData select 0), _currentSelectionData, _title, _description],
		"lils_pda_fnc_addEntry"
	] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	if !(_exception) then
	{
		ctrlEnable [1606, true];
	};
};
