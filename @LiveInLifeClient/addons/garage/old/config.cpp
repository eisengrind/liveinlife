
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};//Test

#include "dialogs\garageMenu.cpp"

class Extended_PreInit_EventHandlers
{
    class lilc_garage_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\garage\XEH_preInitClient.sqf';";
    };
};
