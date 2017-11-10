
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_paycheck_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\paycheck\XEH_serverPreInit.sqf';";
    };
};
