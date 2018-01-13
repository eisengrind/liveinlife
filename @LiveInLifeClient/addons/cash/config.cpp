
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_cash_preInit {
        init = "call compile preProcessFileLineNumbers '\x\lilc\addons\cash\XEH_preInit.sqf';";
    };
};

