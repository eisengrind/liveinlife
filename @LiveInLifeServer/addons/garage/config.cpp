
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_garage_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\garage\XEH_preInit.sqf';";
    };
};
