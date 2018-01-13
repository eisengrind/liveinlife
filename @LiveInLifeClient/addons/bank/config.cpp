
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_bank_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\bank\XEH_clientPreInit.sqf';";
    };
};
