
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_factions_interface {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\factions_interface\XEH_clientPreInit.sqf';";
    };
};

class RscText;
class RscListbox;
class RscButton;
class RscActiveText;
class RscListNBox;
class lilc_RscTree;
class RscTitle;
class RscEdit;
class RscCombo;

#include "gui\overview.cpp"
#include "gui\player.cpp"
#include "gui\rank.cpp"
#include "gui\patrols.cpp"
