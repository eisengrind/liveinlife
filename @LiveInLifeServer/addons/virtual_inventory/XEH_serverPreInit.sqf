
[
    "set_lil_virtual_inventory_inventory",
    {
        _dbCol = ["VIRTUALINVENTORY", true, true];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_virtual_inventory_inventory",
    {
        ["VIRTUALINVENTORY", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
    }
] call lils_login_fnc_addPackage;
