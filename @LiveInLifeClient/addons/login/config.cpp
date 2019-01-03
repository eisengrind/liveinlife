
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"lilc_main", "lilc_api_profiles", "lilc_api_users", "lilc_api", "lilc_faces", "lilc_headless"};
        author = CONTRIBUTORS;
        authors[] = {
            "TheMysteriousVincent"
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgDebriefing.hpp"
#include "ui\RscAttributes.hpp"
