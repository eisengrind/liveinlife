
class CfgPatches {
    #include "CfgPatches.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_virtual_inventory_preInit {
        serverInit = "call compile preProcessFileLineNumbers '\x\lils\addons\virtual_inventory\XEH_serverPreInit.sqf';";
    };
};
