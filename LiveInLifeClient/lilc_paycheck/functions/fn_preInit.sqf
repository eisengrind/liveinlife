
[
	"lilce_common_initPlayer",
	{
		call lilc_paycheck_fnc_init;
		["initializing bankaccount"] call lilc_ui_fnc_setLoadingText;
		["initialize bankaccounts", "lilc_common"] call lilc_common_fnc_diag_log;
	}
] call CBA_fnc_addEventHandler;
