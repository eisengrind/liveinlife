
params [
	["_unit", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_prison_fnc_canAddPunishment) throw false;
	if !(createDialog "lilcm_punishment") throw false;

	lilc_punishments_currentUnit = _unit;
	disableSerialization;
	private _ui = (findDisplay 1643);
	if (isNull _ui) throw false;

	private _punishmentConfigs = ("true" configClasses (missionConfigFile >> "CfgPunishments"));

	private _uiComboPunishments = (_ui displayCtrl 2100);
	lbClear _uiComboPunishments;
	{
		private _punishmentName = (configName _x);
		if ([(format["%1.set", _punishmentName])] call lilc_permissions_fnc_have) then
		{
			private _index = (_uiComboPunishments lbAdd (getText(_x >> "displayName")));
			_uiComboPunishments lbSetData [_index, _punishmentName];
		};
	} forEach _punishmentConfigs;

	throw true;
}
catch
{
	_exception;
};
