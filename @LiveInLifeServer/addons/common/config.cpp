
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgMasterServer {
    #include "CfgMasterServer.cpp"
};

class Extended_PostInit_EventHandlers {
    class lils_common_postInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\common\XEH_postInit.sqf';";
    };
};

class Extended_PreInit_EventHandlers {
    class lils_common_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\common\XEH_preInit.sqf';";
    };
};
