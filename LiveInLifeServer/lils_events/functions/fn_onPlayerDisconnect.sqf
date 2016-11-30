
_unit = (_this select 0);
_uid = (_this select 2);
_name = (_this select 3);

//diag_log str ([_unit] call lilc_inventory_fnc_getInventory);
deleteVehicle _unit;
