
[
	"set_lil_virtualInventory_inventory",
	{
		if (_this isEqualType 0) then
		{
			player setVariable ["lilc_virtualInventory_inventory", [], true];
		}
		else
		{
			player setVariable ["lilc_virtualInventory_inventory", _this, true];
		};
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_virtualInventory_inventory",
	{
		(player getVariable ["lilc_virtualInventory_inventory", []]);
	}
] call lilc_login_fnc_addPackage;
