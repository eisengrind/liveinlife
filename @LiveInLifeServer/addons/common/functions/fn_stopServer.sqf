
["lils_common_stop_server_preLock"] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#lock";
sleep 2;

["lils_common_stop_server_preKick"] call CBA_fnc_localEvent;

{
	private _unit = _x;
	[
		"lils_common_stop_server_kick",
		[_x]
	] call CBA_fnc_localEvent;

	(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand (format["#kick %1", (getPlayerUID _x)]);
} forEach (allPlayers - entities "HeadlessClient_F");

["lils_common_stop_server_postKick"] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#shutdown";
