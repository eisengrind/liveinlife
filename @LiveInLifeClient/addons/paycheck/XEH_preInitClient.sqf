
lilc_paycheck_active = false;
lilc_paycheck_timeout = 0;
lilc_paycheck_amount = 0;
lilc_paycheck_bankName = "";
lilc_paycheck_message = "";

[
	"lilce_common_postFinished",
	{
		[
			{
				if (lilc_paycheck_active && lilc_paycheck_amount > 0) then
				{
					if (lilc_paycheck_bankName == "") then
					{
						[lilc_paycheck_amount] call lilc_cash_fnc_add;

						if (lilc_paycheck_message != "") then
						{
							systemChat format[lilc_paycheck_message, lilc_paycheck_amount];
						};
					}
					else
					{
						if !(isNull (missionConfigFile >> "CfgBanks" >> lilc_paycheck_bankName)) then
						{
							private _bA = ([lilc_paycheck_bankName] call lilc_bank_fnc_getAccountByBankName);

							if ((count _bA) == 5) then
							{
								[(_bA select 4), lilc_paycheck_amount] call lilc_bank_fnc_appendByID;

								if (lilc_paycheck_message != "") then
								{
									systemChat format[lilc_paycheck_message, lilc_paycheck_amount];
								};
							};
						};
					};
				};
			},
			lilc_paycheck_timeout
		] call CBA_fnc_addPerFrameHandler;
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
