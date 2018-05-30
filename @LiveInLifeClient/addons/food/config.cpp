
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    #include "CfgWeapons.cpp"
};

class CfgMagazines {
    #include "CfgMagazines.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_food {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\food\XEH_clientPreInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_food {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\food\XEH_clientPostInit.sqf';";
    };
};
