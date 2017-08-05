
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgMagazines {
    class Default;
    #include "CfgMagazines.cpp"
};

class CfgWeapons {
    class ItemCore;
    class InventoryItem_Base_F;
    #include "CfgWeapons.cpp"
};

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
