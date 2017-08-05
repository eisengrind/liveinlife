
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

#include "dialogs\atcInterface.cpp"

class Extended_PreInit_EventHandlers {
    class lilc_atcInterface_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\atcInterface\XEH_preInit.sqf';";
    };
};
