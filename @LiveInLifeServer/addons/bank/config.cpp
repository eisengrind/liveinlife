
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lils_bank_preInit
    {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\bank\XEH_serverPreInit.sqf';";
    };
};
