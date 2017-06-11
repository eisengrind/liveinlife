
class Extended_PreInit_EventHandlers {
    class lilc_factions {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\factions\XEH_PreInitClient.sqf'";
    };
};

class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};
