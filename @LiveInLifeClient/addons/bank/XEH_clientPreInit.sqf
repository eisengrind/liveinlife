
lilc_bank_accounts = [];

/*[
	"set_lil_bank_accounts",
	{
		lilc_bank_accounts = _this;
	}
] call lilc_login_fnc_addPackage;*/

[
	"lilce_login_postAccountInit",
	{
		[[player], "lils_bank_fnc_getAccounts"] call lilc_common_fnc_sendToServer;
	}
] call CBA_fnc_addEventHandler;
