
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_vehicles_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\vehicles\XEH_preInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_vehicles_postInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\vehicles\XEH_postInit.sqf';";
    };
};

class lilc_RscText;
class lilc_RscTitle;
class lilc_RscButtonCloseIcon;
#include "dialogs\vehicleInformations.cpp"
