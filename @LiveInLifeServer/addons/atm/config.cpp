
class CfgPatches
{
    #include "CfgPatches.cpp"
};

class CfgFunctions
{
    #include "CfgFunctions.cpp"
};

class Extended_PreInit_EventHandlers {
    class lils_atm {
        serverInit = "call compile preprocessFileLineNumbers '\x\lils\addons\atm\XEH_serverPreInit.sqf';";
    };
};
