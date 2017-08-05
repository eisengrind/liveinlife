
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_paycheck_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\paycheck\XEH_preInitClient.sqf';";
    };
};
