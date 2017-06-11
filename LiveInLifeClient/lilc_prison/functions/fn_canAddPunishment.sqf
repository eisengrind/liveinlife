
params [
	["_unit", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (_unit getVariable ["lilc_prison_isJailed", false]) throw false;
	
	private _factionID = (player getVariable ["lilc_factionID", -1]);
	private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
	if (isNull _factionConfig) throw false;
	
	private _punishmentConfigs = ("true" configClasses (missionConfigFile >> "CfgPunishments"));
	if (({ ([(["punishments", (format["%1.set", (configName _x)])] call lilc_permissions_fnc_bindPermission)] call lilc_permissions_fnc_have) } count _punishmentConfigs) <= 0) throw false;

	throw true;
}
catch
{
	_exception;
};
