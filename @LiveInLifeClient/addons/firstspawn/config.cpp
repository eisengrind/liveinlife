
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgSounds {
    sounds[] = {};
    #include "CfgSounds.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_firstspawn_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\firstspawn\XEH_preInit.sqf';";
    };
};
