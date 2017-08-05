
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    #include "CfgWeapons.cpp"
};

class CfgMagazines {
    #include "CfgMagazines.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_food_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\food\XEH_preInit.sqf';";
    };
};
<<<<<<< HEAD:LiveInLifeClient/lilc_common/config.cpp

#include "dialogs\RscDefines.cpp"
//#include "dialogs\loadingScreen.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_common {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\common\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_common {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\common\XEH_postInit.sqf'";
    };
};
=======
>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/food/config.cpp
