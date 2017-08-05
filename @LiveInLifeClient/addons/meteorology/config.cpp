
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp";
};

class Extended_PreInit_EventHandlers
{
    class lilc_meteorology_preInit
    {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\meteorology\XEH_preInit.sqf';";
    };
};
