
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_firstspawn_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\firstspawn\XEH_preInit.sqf';";
    };
};
