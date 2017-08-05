
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    class lilci_itemInfo;
    class lilci_item;

    #include "CfgWeapons.cpp"
};

class CfgMovesBasic {
    #include "CfgMovesBasic.cpp"
};

class CfgMovesMaleSdr : CfgMovesBasic {
    #include "CfgMovesMaleSdr.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscText;
class lilc_RscTitle;

#include "dialogs\giveMoney.cpp"

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_actions_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\actions\XEH_preInit.sqf';";
    };
};
