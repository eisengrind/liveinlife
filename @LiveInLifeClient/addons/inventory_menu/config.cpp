
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "gui\RscDisplayInventory.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_inventory_menu {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\inventory_menu\XEH_clientPreInit.sqf';";
    };
};
