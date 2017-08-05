
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_permissions
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\permissions\XEH_serverPreInit.sqf';";
    };
};
