
lilc_inventory_optionsItems = [];
lilc_inventory_items = [];
{ 
    if (getText(_x >> "displayName") != "") then {
        if (isArray(_x >> "lilc_dropDownOptions")) then {
            lilc_inventory_optionsItems pushBack [(configName _x), getText(_x >> "displayName")]; 
        };
        
        lilc_inventory_items pushBack [(configName _x), getText(_x >> "displayName")]; 
    }; 
} forEach (("true" configClasses (configFile >> "CfgWeapons")) + ("true" configClasses (configFile >> "CfgMagazines")) + ("true" configClasses (configFile >> "CfgGlasses")) + ("true" configClasses (configFile >> "CfgVehicles"))); 

[
	"set_lil_inventory_inventory",
	{
		[player, _this] call lilc_inventory_fnc_setInventory;
	}
] call lilc_login_fnc_addPackage;
