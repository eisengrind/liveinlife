
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscListNBox;
class lilc_RscText;
class lilc_RscTitle;
class lilc_RscCheckbox;
class lilc_RscPicture;
class lilc_RscStructuredText;
class lilc_RscListBox;
class lilc_RscCombo;
class lilc_RscTitle_darkBlueText;
class lilc_RscText_whiteBackground;
class lilc_RscText_darkBlueBackground;
class lilc_RscButtonMenu_greyBackground;
class lilc_RscButtonMenu_darkBlueBackground;

#include "dialogs\buyUniforms.cpp"
#include "dialogs\buyItems.cpp"
#include "dialogs\sell.cpp"
//#include "dialogs\sell.cpp"
//#include "dialogs\vehicle.cpp"

class Extended_PreInit_EventHandlers
{
    class lilc_shops_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\shops\XEH_preInitClient.sqf';";
    };
};
