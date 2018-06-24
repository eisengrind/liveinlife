
lils_login_set_defPackages pushBack "set_lil_atm_recruiter";
[
    "set_lil_atm_recruiter",
    {
        _dbCol = ["bankRecruiter", true, false];
    }
] call lils_login_fnc_addPackage;

["update_lil_atm_recruiter",{
    ["bankRecruiter", _this select 1];
}] call lils_login_fnc_addPackage;
