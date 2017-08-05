
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_vehicles_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\vehicles\XEH_preInit.sqf';";
    };
};
