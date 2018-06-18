
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    #include "CfgWeapons.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_drugs {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\drugs\XEH_clientPreInit.sqf';";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_drugs {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\drugs\XEH_clientPostInit.sqf';";
    };
};
