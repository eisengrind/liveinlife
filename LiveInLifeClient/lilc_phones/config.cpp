
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class CfgWeapons
{
    #include "CfgWeapons.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscControlsGroup;
class lilc_RscListbox;
class lilc_RscText;
class RscActiveText;
class lilc_RscPicture;
#include "dialogs\cellphone.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_phones_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\phones\XEH_preInit.sqf';";
    };
};
