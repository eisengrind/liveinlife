
[
	"lilse_common_afterDatabaseInitialization",
	{
		call lils_vehicles_fnc_loadVehicles;
		[] spawn lils_vehicles_fnc_initSaving;
	}
] call CBA_fnc_addEventHandler;

[
	"lilse_common_restartServer_afterGlobalKick",
	{
		{ _x enableSimulation false; } forEach allMissionObjects "All";
		[] call lils_vehicles_fnc_saveAll;
	}
] call CBA_fnc_addEventHandler;
