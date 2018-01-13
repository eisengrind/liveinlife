
["lils_common_stop_server_preLock"] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "server_commandPassword")) servercommand "#lock";
sleep 2;

["lils_common_stop_server_preKick"] call CBA_fnc_localEvent;

{
	_x enableSimulation false;
} forEach ((allMissionObjects "All") + (allPlayers - entities "HeadlessClient_F"));

[
	false,
	"lilc_common_fnc_stopServerReceived",
	-2,
	false
] call lilc_common_fnc_send;
sleep 5;

{
	private _unit = _x;
	[
		"lils_common_stop_server_kick",
		[_x]
	] call CBA_fnc_localEvent;

	(getText(configFile >> "CfgMasterServer" >> "server_commandPassword")) servercommand (format["#kick %1", (name _x)]);
} forEach (allPlayers - entities "HeadlessClient_F");

["lils_common_stop_server_postKick"] call CBA_fnc_localEvent;

(getText(configFile >> "CfgMasterServer" >> "server_commandPassword")) servercommand "#shutdown";
