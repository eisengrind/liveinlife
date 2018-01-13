
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_logs_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\logs\XEH_preInit.sqf';";
    };
};
