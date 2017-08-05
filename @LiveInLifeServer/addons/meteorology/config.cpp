
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_meteorology_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\meteorology\XEH_preInit.sqf';";
    };
};
