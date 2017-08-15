
lilc_paycheck_active = 0;
lilc_paycheck_bankID = -1;

lilc_paycheck_timeout = (60 * 30);
lilc_paycheck_amount = 45;
lilc_paycheck_bankID = 0;
lilc_paycheck_message = "Du hast einen Paycheck in Höhe von $%1 erhalten.";
lilc_paycheck_status = 0;

[
	"lilce_common_postFinished",
	{
		if (lilc_paycheck_active isEqualTo 1 && lilc_paycheck_bankID > 0) then
		{
			[
				lilc_paycheck_amount,
				lilc_paycheck_timeout,
				lilc_paycheck_bankID,
				lilc_paycheck_message,
				lilc_paycheck_status
			] execFSM "\x\lilc\addons\paycheck\paycheck.fsm";
		};
	}
] call CBA_fnc_addEventHandler;

[
	"set_lil_paycheck",
	{
		lilc_paycheck_active = (_this select 0);
		lilc_paycheck_bankID = (_this select 1);
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_paycheck_active",
	{
		lilc_paycheck_active;
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_paycheck_bankID",
	{
		lilc_paycheck_bankID;
	}
] call lilc_login_fnc_addPackage;
