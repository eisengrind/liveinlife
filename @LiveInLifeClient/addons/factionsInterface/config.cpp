
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "CfgFactionsInterfacePermissions.cpp"

class lilc_RscButtonMenu;
class lilc_RscListbox;
class lilc_RscText;
class lilc_RscTitle;
class lilc_RscEdit;
class lilc_RscListNBox;
class lilc_RscShortcutButton;
class lilc_RscCombo;
class lilc_RscButton;

//#include "dialogs\factionsInterface.cpp"
#include "dialogs\dashboard.cpp"
//#include "dialogs\groups.cpp"
//#include "dialogs\players.cpp"
//#include "dialogs\ranks.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_factionsInterface_preInit {
<<<<<<< HEAD:LiveInLifeClient/lilc_factionsInterface/config.cpp
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\factionsInterface\XEH_preInit.sqf';";
=======
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\factionsInterface\XEH_preInitClient.sqf';";
>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/factionsInterface/config.cpp
    };
};
