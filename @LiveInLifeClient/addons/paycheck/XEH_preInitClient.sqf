
lilc_paycheck_paychecks = [[], []] call CBA_fnc_hashCreate;
lilc_paycheck_timeout = 0;
lilc_paycheck_enableMessage = true;
lilc_paycheck_active = 0;

[
    "lilc_paycheck_enableMessage",
    "CHECKBOX",
    "Paycheck-Nachrichten anzeigen", //TODO: localize
    "LiveInLife Paycheck",
    true,
    0,
    {}
] call CBA_Settings_fnc_init;

["lilce_common_postFinished", {
    [lilc_paycheck_fnc_executePaychecks, nil, lilc_paycheck_timeout] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["set_lil_paycheck_bankID", {
    lilc_paycheck_bankID = _this;
}] call lilc_login_fnc_addPackage;

["set_lil_paycheck", {
    lilc_paycheck_active = _this;
}] call lilc_login_fnc_addPackage;

["update_lil_paycheck_active", {
    lilc_paycheck_active;
}] call lilc_login_fnc_addPackage;

["update_lil_paycheck_bankID", {
    lilc_paycheck_bankID;
}] call lilc_login_fnc_addPackage;
