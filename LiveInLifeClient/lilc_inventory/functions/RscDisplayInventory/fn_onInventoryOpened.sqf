
if (isNil "lilc_inventory_items" || isNil "lilc_inventory_optionsItems") then {
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
};

if (isNil "lilc_virtualInventory_inventory") then { lilc_virtualInventory_inventory = []; };
call lilc_inventory_fnc_disableMenu;
call lilc_inventory_fnc_updateVirtualInventory;
