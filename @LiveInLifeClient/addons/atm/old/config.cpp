
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgEditorCategories {
    #include "CfgEditorCategories.cpp"
};

class CfgEditorSubcategories {
    #include "CfgEditorSubcategories.cpp"
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscListbox;
class lilc_RscPicture;
class lilc_RscStructuredText;
#include "gui\atm.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_atm {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\atm\XEH_clientPreInit.sqf';";
    };
};
