
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PostInit_EventHandlers {
    class lils_exchange_postInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\exchange\XEH_postInit.sqf';";
    };
};
