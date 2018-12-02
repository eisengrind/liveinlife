
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"lilc_main", "lilc_api"};
        author = CONTRIBUTORS;
        authors[] = {
            "TheMysteriousVincent"
        };
    };
};

#include "CfgEventHandlers.hpp"
