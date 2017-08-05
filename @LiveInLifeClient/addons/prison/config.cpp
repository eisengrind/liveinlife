
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class lilc_RscPicture;
class lilc_RscProgress;
class lilc_RscStructuredText;
class lilc_RscButtonMenu;
class lilc_RscText;
class lilc_RscCheckbox;
class lilc_RscCombo;

//#include "dialogs\prison.cpp"
#include "dialogs\punishment.cpp"

class RscTitles {
    #include "dialogs\prisonStatus.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_prison_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\prison\XEH_clientPreInit.sqf';";
    };
};
