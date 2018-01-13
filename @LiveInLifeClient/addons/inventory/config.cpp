
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "dialogs\RscDisplayInventory.cpp"

class Extended_PostInit_EventHandlers
{
    class lilc_inventory_postInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\inventory\XEH_clientPostInit.sqf';";
    };
};

class Extended_PreInit_EventHandlers
{
    class lilc_inventory_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\inventory\XEH_clientPreInit.sqf';";
    };
};
