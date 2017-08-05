
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class lilc_RscControlsGroup;
class lilc_RscPicture;
class lilc_RscProgress;
class lilc_RscText;
class lilc_RscStructuredText;
class lilc_RscTitle;

#include "dialogs\progress.cpp"
#include "dialogs\groupHint.cpp"

class RscTitles {
    #include "dialogs\logo.cpp"
    #include "dialogs\hud.cpp"
    #include "dialogs\hint.cpp"
    #include "dialogs\stats.cpp"
    #include "dialogs\loading.cpp"
    #include "dialogs\aircraftInfo.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_ui_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\ui\XEH_preInit.sqf';";
    };
};

class CfgHints
{
    #include "CfgHints.cpp"
};

class CfgUIGrids
{
    #include "CfgUIGrids.cpp"
};
