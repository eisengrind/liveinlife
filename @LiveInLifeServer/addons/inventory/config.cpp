
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_inventory_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\inventory\XEH_serverPreInit.sqf';";
    };
};
