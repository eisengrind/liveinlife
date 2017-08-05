
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

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
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\login\XEH_clientPreInit.sqf';";
    };
};

