
(getText(configFile >> "CfgMasterServer" >> "server_commandPassword")) servercommand "#lock";

[
	"lilse_common_afterDatabaseInitialization",
	{
		{
			private _t = _x;
			reverse _t;
			[_t, { [] spawn lils_common_fnc_stopServer; }] call lilc_time_fnc_addEvent;
		} forEach getArray(configFile >> "CfgMasterServer" >> "server_shutdowns");

		{
			private _t = (_x select 0);
			reverse _t;
			private _message = (_x select 1);

			[_t, { [(_this select 1), "hint", -2] call lilc_common_fnc_send; }, _message] call lilc_time_fnc_addEvent;
		} forEach getArray(configFile >> "CfgMasterServer" >> "server_messages");
	}
] call CBA_fnc_addEventHandler;

lils_database_defaultProtocolName = "LiveInLife";
