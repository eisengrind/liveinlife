
params [
	["_target", objNull, [objNull]],
	["_punisher", objNull, [objNull]],
	["_punishmentName", "", [""]],
	["_waitingTime", -2, [0]],
	["_securityIssue", false, [false]],
	["_psychatricKeeping", false, [false]]
];

try
{
	if !([_target] call lilc_common_fnc_isAlive) throw false;
	if !([_punisher] call lilc_common_fnc_isAlive) throw false;

	private _punishmentConfigs = ("true" configClasses (missionConfigFile >> "CfgPunishments"));
	if (({ ((configName _x) == _punishmentName) } count _punishmentConfigs) != 1) throw false;

	[([
		"ACCOUNT_DATA",
		[
			["prison_waitingTime", _waitingTime],
			["prison_escapeTime", 0],
			["prison_currentPunishment", (str _punishmentName)],
			["prison_securityIssue", _securityIssue],
			["prison_psychatricKeeping", _psychatricKeeping]
		],
		[
			["STEAM64ID", (getPlayerUID _target)]
		]
	] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;

	[[_punishmentName, _waitingTime, 0], "lilc_prison_fnc_punished", _target] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
