
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_log {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\log\XEH_preInit.sqf';";
    };
};
