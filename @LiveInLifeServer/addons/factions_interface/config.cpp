
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_factions_interface_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\factions_interface\XEH_preInit.sqf';";
    };
};
