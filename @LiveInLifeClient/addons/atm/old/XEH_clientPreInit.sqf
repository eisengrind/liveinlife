
lilc_atm_recruiter = 0;

[
    "set_lil_atm_recruiter",
    {
        lilc_atm_recruiter = _this;
    }
] call lilc_login_fnc_addPackage;

lilc_login_update_defPackages pushBack "update_lil_atm_recruiter";
["update_lil_atm_recruiter", {
    lilc_atm_recruiter;
}] call lilc_login_fnc_addPackage;
