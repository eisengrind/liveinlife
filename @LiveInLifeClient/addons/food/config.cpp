
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgWeapons {
    #include "CfgWeapons.cpp"
};

class CfgMagazines {
    #include "CfgMagazines.cpp"
};

class Extended_PreInit_EventHandlers
{
    class lilc_food_preInit
    {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\food\XEH_preInit.sqf';";
    };
};
