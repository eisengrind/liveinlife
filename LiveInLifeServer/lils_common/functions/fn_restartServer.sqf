
[
	"lilse_common_restartServer_beforeLock"
] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#lock";
sleep 2;

[
	"lilse_common_restartServer_beforeGlobalKick"
] call CBA_fnc_localEvent;

{
	private _unit = _x;
	[
		"lilse_common_restartServer_kickPlayer",
		[_x]
	] call CBA_fnc_localEvent;

	(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand (format["#kick %1", (getPlayerUID _x)]);
} forEach (allPlayers - entities "HeadlessClient_F");

[
	"lilse_common_restartServer_afterGlobalKick"
] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#shutdown";
