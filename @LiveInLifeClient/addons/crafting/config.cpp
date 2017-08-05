
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgSounds {
    #include "CfgSounds.cpp"
};

class lilc_RscText;
class lilc_RscTitle;
class lilc_RscListbox;
class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscPicture;
class lilc_RscStructuredText;
class RscActiveText;

#include "dialogs\crafting.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_crafting_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\crafting\XEH_preInit.sqf';";
    };
};
