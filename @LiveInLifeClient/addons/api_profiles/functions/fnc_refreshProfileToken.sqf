#include "..\script_component.hpp"

[
    "profiles/auth/refresh",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILE_ACCESS_TOKEN_HEADER, GVAR(api_profiles,token)
    ],
    format["refresh_token=%1", GVAR(api_profiles,refresh_token)]
] call EFUNC(api,request);
