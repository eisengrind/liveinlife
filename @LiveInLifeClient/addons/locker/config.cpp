
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscCombo;
class lilc_RscStructuredText;
class lilc_RscText_darkBlueBackground;
class lilc_RscText_whiteBackground;
class lilc_RscTitle;

#include "dialogs\locker.cpp"

class Extended_PreInit_EventHandlers
{
    class lilc_locker_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\locker\XEH_clientPreInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers
{
    class lilc_locker_postInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\locker\XEH_clientPostInit.sqf';";
    };
};
