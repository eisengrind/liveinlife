
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgVirtualItems {
    #include "CfgVirtualItems.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_keys {
        clientInit = "call compile preprocessFileLineNumbers '\x\lilc\addons\keys\XEH_preInit.sqf'";
    };
};
