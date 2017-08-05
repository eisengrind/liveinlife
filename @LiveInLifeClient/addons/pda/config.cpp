
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_preInit_EventHandlers {
    class lilc_pda {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\pda\XEH_preInit.sqf'";
    };
};

class lilc_RscButtonMenu;
class lilc_RscCombo;
class lilc_RscControlsGroup;
class lilc_RscEdit;
class lilc_RscListbox;
class lilc_RscStructuredText;
class lilc_RscText;

#include "dialogs\pda.cpp"
