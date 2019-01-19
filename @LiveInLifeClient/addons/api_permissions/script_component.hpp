
#define COMPONENT api_permissions
#define COMPONENT_BEAUTIFIED Permissions API
#include "\x\lilc\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_API_PERMISSIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_API_PERMISSIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_API_PERMISSIONS
#endif

#include "\x\lilc\addons\main\script_macros.hpp"
#include "\x\lilc\addons\api_users\script_macros_common.hpp"
