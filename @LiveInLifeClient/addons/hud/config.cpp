
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class lilc_RscPicture;
class lilc_RscStructuredText;

class RscTitles
{
    #include "dialogs\hud.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_hud
    {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\hud\XEH_preInit.sqf';";
    };
};
