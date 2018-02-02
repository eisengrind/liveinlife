
class CfgPatches {
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_butt_inventory {
        serverInit = "call compile preprocessFileLineNumbers '\x\lils\addons\butt_inventory\XEH_preInit.sqf';";
    };
};
