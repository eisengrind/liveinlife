
//insert custom macros

#define TARGET_ENDPOINT (if (count EGVAR(headless,headlessClients) == 0) then { \
        2;\
    } else { \
        (selectRandom EGVAR(headless,headlessClients)); \
    })

#define TARGET_ENDPOINT_CBA_EVENT(var1,var2) (if (count EGVAR(headless,headlessClients) == 0) then { \
        [(var1),(var2)] call CBA_fnc_serverEvent; \
    } else { \
        [(var1),(var2),(selectRandom EGVAR(headless,headlessClients))] call CBA_fnc_targetEvent; \
    })

#define IS_HEADLESS (isServer || isDedicated || !(hasInterface || isDedicated))
