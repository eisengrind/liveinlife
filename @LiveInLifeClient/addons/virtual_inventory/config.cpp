
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "gui\RscDisplayInventory.cpp"

class Extended_PreInit_EventHandlers
{
    class lilc_virtual_inventory_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\virtual_inventory\XEH_clientPreInit.sqf';";
    };
};
