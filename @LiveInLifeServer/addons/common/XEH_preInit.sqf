
(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#lock";

[
	"lilse_common_afterDatabaseInitialization",
	{
		[] spawn lils_common_fnc_waitUntilRestart;
	}
] call CBA_fnc_addEventHandler;
