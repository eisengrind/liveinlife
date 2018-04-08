
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_factionsInterface_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\factionsInterface\XEH_preInit.sqf';";
    };
};
