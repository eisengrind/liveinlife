
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class RscText;
class lilc_RscTree;
class RscStructuredText;
class RscTitle;
class RscEdit;
class RscCombo;
class RscButton;
class RscActiveText;

#include "gui\patrols.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_patrols {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\patrols\XEH_clientPreInit.sqf';";
    };
};
