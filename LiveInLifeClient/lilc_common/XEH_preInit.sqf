
[
	"lilce_common_initPlayer",
	{
		call lilc_factions_fnc_init;
		["initializing faction group"] call lilc_ui_fnc_setLoadingText;
		["player group set", "lilc_common"] call lilc_common_fnc_diag_log;
	}
] call CBA_fnc_addEventHandler;
