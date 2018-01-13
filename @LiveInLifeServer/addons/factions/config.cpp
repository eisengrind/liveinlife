
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_factions_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\factions\XEH_serverPreInit.sqf';";
    };
};
