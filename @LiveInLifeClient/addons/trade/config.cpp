
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

<<<<<<< HEAD:LiveInLifeClient/lilc_login/config.cpp
class CfgDebriefing {
    #include "CfgDebriefing.cpp"
};

class lilc_RscListbox;
class lilc_RscText;
class lilc_RscPicture;
class lilc_RscControlsGroup;
class lilc_RscShortcutButton;

#include "dialogs\login.cpp"
//#include "dialogs\signup.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_login_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\login\XEH_preInit.sqf';";
    };
};

=======
class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscListbox;
class lilc_RscStructuredText;
class lilc_RscText;

#include "dialogs\trade.cpp"
>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/trade/config.cpp
