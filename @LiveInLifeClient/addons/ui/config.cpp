
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Functions_F", "A3_Data_F", "A3_Soft_F", "A3_Soft_F_Offroad_01", "A3_Characters_F", "lilc_main", "lilc_common"};
        author = CONTRIBUTORS;
        authors[] = {
            "TheMysteriousVincent"
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgHints.hpp"
#include "CfgUIGrids.hpp"
#include "ui\RscAttributes.hpp"
