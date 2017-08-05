
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_virtualInventory_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\virtualInventory\XEH_serverPreInit.sqf';";
    };
};
