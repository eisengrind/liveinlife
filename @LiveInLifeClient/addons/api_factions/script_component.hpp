
#define COMPONENT api_factions
#define COMPONENT_BEAUTIFIED Factions API
#include "\x\lilc\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_API_FACTIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_API_FACTIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_API_FACTIONS
#endif

#include "\x\lilc\addons\main\script_macros.hpp"
#include "\x\lilc\addons\api_users\script_macros_common.hpp"
#include "\x\lilc\addons\api_profiles\script_macros_common.hpp"
#include "script_macros_common.hpp"
