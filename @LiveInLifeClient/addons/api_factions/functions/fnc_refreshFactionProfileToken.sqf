#include "..\script_component.hpp"

[
    "factions/profiles/auth/refresh",
    [],
    "POST",
    [
        QFACTION_PROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_factions,token)
    ],
    format["refresh_token=%1", GVAR(refresh_token)]
] call EFUNC(api,request);
