
[
	"set_lil_paycheck",
	{
		_dbCol = [
			["paycheck_active", true, false],
			["paycheck_bankID", true, false]
		];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_paycheck_active",
	{
		_dbCol = ["paycheck_active", true, false];
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_paycheck_bankID",
	{
		_dbCol = ["paycheck_bankID", true, false];
	}
] call lilc_login_fnc_addPackage;
