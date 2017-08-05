
lilc_paycheck_timeout = (60 * 30);
lilc_paycheck_amount = 45;
lilc_paycheck_defaultBankaccount = "tanBank";

[
	"lilce_common_preFinished",
	{
		call lilc_paycheck_fnc_init;
	}
] call CBA_fnc_addEventHandler;
