
["set_lil_paycheck", {
    _dbCol = ["paycheck_active", true, false];
}] call lils_login_fnc_addPackage;

["update_lil_paycheck_active", {
    ["paycheck_active", (_this select 1)];
}] call lils_login_fnc_addPackage;

["set_lil_paycheck_bankID", {
    _dbCol = ["paycheck_bankID", true, false];
}] call lils_login_fnc_addPackage;

["update_lil_paycheck_bankID", {
    ["paycheck_bankID", (_this select 1)];
}] call lils_login_fnc_addPackage;
