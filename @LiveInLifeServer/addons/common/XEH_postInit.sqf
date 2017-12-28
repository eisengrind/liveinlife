
lils_finished = false;
publicVariable "lils_finished";

call lils_database_fnc_init;

[
	"lilse_common_beforeDatabaseInitialization",
	[]
] call CBA_fnc_localEvent;

[
	"lilse_common_fnc_initializeDatabases",
	[]
] call CBA_fnc_localEvent;
call lils_database_fnc_lock;

[
	"lilse_common_afterDatabaseInitialization",
	[]
] call CBA_fnc_localEvent;

lils_finished = true;
publicVariable "lils_finished";
(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#unlock";
