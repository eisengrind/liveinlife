
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
    class lilc_marker_filter
    {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\marker_filter\XEH_clientPostInit.sqf';";
    };
};

#include "gui\marker_filter.cpp"
