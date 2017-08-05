
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

<<<<<<< HEAD:LiveInLifeClient/lilc_crafting/config.cpp
=======
class CfgVehicles {
    #include "CfgVehicles.cpp"
};

>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/transponder/config.cpp
class CfgSounds {
    #include "CfgSounds.cpp"
};

class lilc_RscText;
class lilc_RscTitle;
class lilc_RscListbox;
class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscPicture;
<<<<<<< HEAD:LiveInLifeClient/lilc_crafting/config.cpp
class lilc_RscStructuredText;
class RscActiveText;

#include "dialogs\crafting.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_crafting_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\crafting\XEH_preInit.sqf';";
    };
};
=======
class lilc_RscText;

#include "dialogs\transponder.cpp"
>>>>>>> 57e476db94a41457d9f7cb5bca8da2e830fd3063:@LiveInLifeClient/addons/transponder/config.cpp
