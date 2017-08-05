
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_events_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\events\XEH_preInit.sqf';";
    };
};
