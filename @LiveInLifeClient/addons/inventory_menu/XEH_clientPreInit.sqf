
lilc_inventory_menu_logic_itemOptions = "logic" createVehicleLocal [0, 0, 0];
lilc_inventory_menu_logic_itemTable = "logic" createVehicleLocal [0, 0, 0];

private _items = ("getText(_x >> 'displayName') != ''" configClasses (configFile >> "CfgWeapons")) +
    ("getText(_x >> 'displayName') != ''" configClasses (configFile >> "CfgMagazines")) +
    ("getText(_x >> 'displayName') != ''" configClasses (configFile >> "CfgGlasses"));

for "_i" from 0 to (count _items) - 1 do {
    lilc_inventory_menu_logic_itemTable setVariable [getText((_items select _i) >> "displayName"), configName (_items select _i)];
};
