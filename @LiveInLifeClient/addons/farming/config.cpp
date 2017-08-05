
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    class lilci_item;
    class lilci_itemInfo;
    #include "CfgWeapons.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_farming_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\farming\XEH_clientPreInit.sqf';";
    };
};
