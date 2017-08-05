
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"    
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_tags_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\tags\XEH_preInit.sqf';";
    };
};
