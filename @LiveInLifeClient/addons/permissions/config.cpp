
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_permissions_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\permissions\XEH_clientPreInit.sqf';";
    };
};
