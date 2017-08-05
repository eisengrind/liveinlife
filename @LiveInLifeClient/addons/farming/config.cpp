
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    class lilci_item;
    class lilci_itemInfo;
    #include "CfgWeapons.cpp"
};

<<<<<<< HEAD:LiveInLifeClient/lilc_actions/config.cpp
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
=======
class Extended_PreInit_EventHandlers
{
    class lilc_farming_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\farming\XEH_clientPreInit.sqf';";
    };
>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/farming/config.cpp
};
