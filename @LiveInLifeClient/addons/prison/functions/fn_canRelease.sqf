
params [
	["_unit", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if !(_unit getVariable ["lilc_prison_isJailed", false]) throw false;

	private _factionID = (player getVariable ["lilc_factionID", -1]);
	if (_factionID <= -1) throw false;

	private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
	if (isNull _factionConfig) throw false;

	if ((["prison_canRelease", "NUMBER", 0, _factionConfig] call lilc_common_fnc_getSetting) != 1) throw false;
	
	private _punishmentName = (_unit getVariable ["lilc_prison_currentPunishment", ""]);
	if (_punishmentName == "") throw false;
	
	private _punishmentConfigs = ("true" configClasses (missionConfigFile >> "CfgPunishments"));
	if (({ ((configName _x) == _punishmentName) } count _punishmentConfigs) != 1) throw false;
	if !([(["punishments", (format["%1.remove", _punishmentName])] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) throw false;

	throw true;
}
catch
{
	_exception;
};
