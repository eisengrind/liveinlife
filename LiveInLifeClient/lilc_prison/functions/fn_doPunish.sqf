
try
{
	if (isNull lilc_punishments_currentUnit) throw false;
	if !([lilc_punishments_currentUnit] call lilc_common_fnc_isAlive) throw false;
	if (lilc_punishments_currentUnit getVariable ["lilc_prison_isJailed", false]) then
	{
		["Diese Person besitzt bereits eine Strafe.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	disableSerialization;
	private _ui = (findDisplay 1643);
	if (isNull _ui) throw false;

	private _uiComboPunishments = (_ui displayCtrl 2100);
	private _uiComboPunishmentTimes = (_ui displayCtrl 2101);
	private _uiCheckSecurityIssue = (_ui displayCtrl 2800);
	private _uiCheckPsychatricKeeping = (_ui displayCtrl 2801);

	private _punishmentName = (_uiComboPunishments lbData (lbCurSel _uiComboPunishments));
	private _waitingTime = (_uiComboPunishmentTimes lbValue (lbCurSel _uiComboPunishmentTimes));

	private _securityIssue = (ctrlChecked _uiCheckSecurityIssue);
	private _psychatricKeeping = (ctrlChecked _uiCheckPsychatricKeeping);

	if (_punishmentName == "") then
	{
		["Du hast keine Strafe ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	[[lilc_punishments_currentUnit, player, _punishmentName, _waitingTime, _securityIssue, _psychatricKeeping], "lils_prison_fnc_doPunish"] call lilc_common_fnc_sendToServer;
	
	[(format["Du hast %1 bestraft.", ([lilc_punishments_currentUnit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName)])] call lilc_ui_fnc_hint;
	closeDialog 1643;
}
catch
{
	_exception;
};
