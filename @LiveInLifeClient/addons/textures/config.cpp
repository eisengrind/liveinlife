
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_textures_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\textures\XEH_preInitClient.sqf';";
    };
};
