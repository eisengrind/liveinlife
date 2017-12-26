
lilc_paycheck_handle = -1;
lilc_paycheck_timeout = 0;
lilc_paycheck_amount = 0;
lilc_paycheck_bankName = "";
lilc_paycheck_enableMessage = true;
lilc_paycheck_waitTime = 0;

[
	"lilce_common_postFinished",
	{
		if (lilc_paycheck_active) then
		{
			lilc_paycheck_handle = (call lilc_paycheck_fnc_addPaycheck);
		};
	}
] call CBA_fnc_addEventHandler;

[
	"set_lil_paycheck",
	{
		lilc_paycheck_active = ([(_this select 0)] call lilc_common_fnc_toBool);
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
		"";
	}
] call lilc_login_fnc_addPackage;

/*
[
	"lilc_paycheck_amount",
	"EDITBOX",
	"Paycheck amount",
	"LiveInLife Paycheck",
	"0",
	1,
	{
		lilc_paycheck_amount = (parseNumber _this);
	}
] call CBA_Settings_fnc_init;
*/
