
[
	"lilse_common_afterDatabaseInitialization",
	{
		call lils_vehicles_fnc_loadVehicles;
		[] spawn lils_vehicles_fnc_initSaving;
	}
] call CBA_fnc_addEventHandler;

[
	"lils_common_stop_server_postKick",
	{
		{
			_x enableSimulation false;
		} forEach allMissionObjects "All";
		[] call lils_vehicles_fnc_saveAll;
	}
] call CBA_fnc_addEventHandler;
