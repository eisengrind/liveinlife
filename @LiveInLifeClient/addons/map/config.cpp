
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class Extended_PostInit_EventHandlers
{
    class lilc_map
    {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\map\XEH_clientPostInit.sqf';";
    };
};
