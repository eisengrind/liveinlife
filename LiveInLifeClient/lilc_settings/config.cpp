
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

/*class lilc_RscButtonMenu;
class lilc_RscCheckbox;
class lilc_RscListNBox;
class lilc_RscText;
class lilc_RscTitle;
class lilc_RscXSliderH;

#include "dialogs\settings.cpp"*/

class Extended_PreInit_EventHandlers {
    class lilc_settings_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\settings\XEH_preInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_settings_postInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\settings\XEH_postInit.sqf';";
    };
};
