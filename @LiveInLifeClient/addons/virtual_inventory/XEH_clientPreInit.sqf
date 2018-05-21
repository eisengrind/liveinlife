
[
    "set_lil_virtual_inventory_inventory",
    {
        if (_this isEqualType 0) then
        {
            player setVariable ["lilc_virtual_inventory_inventory", [], true];
        }
        else
        {
            player setVariable ["lilc_virtual_inventory_inventory", _this, true];
        };
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_virtual_inventory_inventory",
    {
        (player getVariable ["lilc_virtual_inventory_inventory", []]);
    }
] call lilc_login_fnc_addPackage;
