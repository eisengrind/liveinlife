
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class CfgWeapons {
    #include "CfgWeapons.cpp"
};

/*class CfgSounds {
    sounds[] = {};
    #include "CfgSounds.cpp"
};*/

class Extended_PreInit_EventHandlers {
    class lilc_picklock_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\picklock\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class lilc_picklock_postInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\picklock\XEH_postInit.sqf'";
    };
};
