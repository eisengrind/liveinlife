
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
    class lilc_time
    {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\time\XEH_preInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers
{
    class lilc_time
    {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\time\XEH_postInit.sqf';";
    };
};
