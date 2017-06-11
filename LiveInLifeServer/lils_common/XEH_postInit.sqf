
lils_finished = false;
publicVariable "lils_finished";

call compile preProcessFileLineNumbers "\x\lilc\addons\common\KRON_Strings.sqf";

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

lils_database_defaultProtocolName = (["database_defaultProtocolName", "STRING", "LiveInLifeDatabse", (configFile >> "CfgMasterServer")] call lilc_common_fnc_getSetting);

[
	"lilse_common_afterDatabaseInitialization",
	[]
] call CBA_fnc_localEvent;

//call lils_animals_fnc_init;

lils_finished = true;
publicVariable "lils_finished";
(getText(configFile >> "CfgMasterServer" >> "serverCommandPassword")) servercommand "#unlock";
