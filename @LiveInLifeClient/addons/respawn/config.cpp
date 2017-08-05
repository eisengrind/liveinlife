
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class lilc_RscStructuredText;

class RscTitles {
    #include "dialogs\respawn.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_respawn_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\respawn\XEH_clientPreInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers
{
    class lilc_respawn_postInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\respawn\XEH_clientPostInit.sqf';";
    };
};
