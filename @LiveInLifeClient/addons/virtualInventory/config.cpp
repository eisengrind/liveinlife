
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_virtualInventory_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\virtualInventory\XEH_clientPreInit.sqf';";
    };
};
