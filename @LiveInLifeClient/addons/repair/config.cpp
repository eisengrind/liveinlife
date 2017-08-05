
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class CfgVehicles
{
    #include "CfgVehicles.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_repair_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\repair\XEH_preInit.sqf';";
    };
};
