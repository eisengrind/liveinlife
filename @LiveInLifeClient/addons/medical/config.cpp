
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class CfgMovesBasic {
    #include "CfgMovesBasic.cpp"
};

class CfgMovesMaleSdr : CfgMovesBasic {
    #include "CfgMovesMaleSdr.cpp"
};

class CfgVehicles {
    #include "CfgVehicles.cpp"
};

class CfgWeapons {
    class lilci_item;
    class lilci_itemInfo;
    
    #include "CfgWeapons.cpp"
};

class RscButton;

#include "dialogs\reviveOptions.cpp"
