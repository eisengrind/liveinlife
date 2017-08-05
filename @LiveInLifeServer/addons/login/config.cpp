
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_login_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\login\XEH_serverPreInit.sqf';";
    };
};
