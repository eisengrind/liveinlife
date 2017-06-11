
[
	"lilce_common_initPlayer",
	{
		["requesting bankaccounts"] call lilc_ui_fnc_setLoadingText;
		["requesting bankaccounts data", "lilc_common"] call lilc_common_fnc_diag_log;
		call lilc_bank_fnc_init;
		["bank bankaccounts requested"] call lilc_ui_fnc_setLoadingText;
		["bank data requested", "lilc_common"] call lilc_common_fnc_diag_log;
	}
] call CBA_fnc_addEventHandler;
