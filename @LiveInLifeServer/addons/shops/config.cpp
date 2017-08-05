
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_cleanup_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\cleanup\XEH_preInit.sqf';";
    };
};
