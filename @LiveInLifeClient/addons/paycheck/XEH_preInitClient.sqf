
lilc_paycheck_handle = -1;
lilc_paycheck_timeout = 0;
lilc_paycheck_amount = 0;
lilc_paycheck_enableMessage = true;
lilc_paycheck_waitTime = 0;
lilc_paycheck_active = 0;

[
    "lilce_common_postFinished",
    {
        if (isNil "lilc_paycheck_active") then {
            lilc_paycheck_active = 0;
        };

        if (lilc_paycheck_active == 1) then {
            (call lilc_paycheck_fnc_enable);
        };
    }
] call CBA_fnc_addEventHandler;

["set_lil_paycheck_bankID", {
    lilc_paycheck_bankID = _this;
}] call lilc_login_fnc_addPackage;

["set_lil_paycheck", {
    lilc_paycheck_active = _this;
}] call lilc_login_fnc_addPackage;

["update_lil_paycheck_active", {
    lilc_paycheck_active;
}] call lilc_login_fnc_addPackage;

["update_lil_paycheck_active", {
    lilc_paycheck_bankID;
}] call lilc_login_fnc_addPackage;
