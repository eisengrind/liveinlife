
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_viewDistance_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\viewDistance\XEH_preInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_viewDistance_postInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\viewDistance\XEH_postInit.sqf';";
    };
};
