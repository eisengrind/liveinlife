
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

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class RscText;
class RscListbox;
class RscButton;
class RscActiveText;

#include "gui\butt_inventory.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_butt_inventory {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\butt_inventory\XEH_clientPreInit.sqf';";
    };
};
