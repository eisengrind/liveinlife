
[
	"lilse_common_afterDatabaseInitialization",
	{
		call lils_vehicles_fnc_loadVehicles;

		private _timeout = (["vehicles_saveInterval", "NUMBER", 0, (configFile >> "CfgMasterServer")] call lilc_common_fnc_getSetting);
		[
			{
				call lils_vehicles_fnc_saveAll;
			},
			(if (_timeout > 0) then { _timeout; } else { (4 * 60); })
		] call CBA_fnc_addPerFrameHandler;
	}
] call CBA_fnc_addEventHandler;

[
	"lils_common_stop_server_postKick",
	{
		[] call lils_vehicles_fnc_saveAll;
	}
] call CBA_fnc_addEventHandler;
