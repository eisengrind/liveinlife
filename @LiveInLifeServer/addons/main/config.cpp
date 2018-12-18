
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_xeh",
            "cba_ui"
        };
        author = CONTRIBUTORS;
        authors[] = {"TheMysteriousVincent"};
    };
};
