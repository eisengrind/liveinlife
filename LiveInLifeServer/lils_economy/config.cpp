
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_economy_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\economy\XEH_preInit.sqf';";
    };
};
