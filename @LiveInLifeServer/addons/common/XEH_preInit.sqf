
(getText(configFile >> "CfgMasterServer" >> "server_commandPassword")) servercommand "#lock";

private _shutdowns = (getArray(configFile >> "CfgMasterServer" >> "server_shutdowns"));

[
	"lilse_common_afterDatabaseInitialization",
	{
		{
			private _t = _x;
			reverse _t;
			[_t, { [] spawn lils_common_fnc_stopServer; }] call lilc_time_fnc_addEvent;
		} forEach _shutdowns;
	}
] call CBA_fnc_addEventHandler;

lils_database_defaultProtocolName = "LiveInLife";
