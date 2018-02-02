
lils_login_set_defPackages pushBack "set_lil_butt_inventory";

[
    "set_lil_butt_inventory",
    {
        _dbCol = ["CHARISMA", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_butt_inventory",
    {
        ["butt_inventory", [(_this select 1)] call lils_common_fnc_arrayEncode];
    }
] call lils_login_fnc_addPackage;
