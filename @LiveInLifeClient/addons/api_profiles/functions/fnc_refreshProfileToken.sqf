#include "..\script_component.hpp"

[
    "profiles/auth/refresh",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    format["refresh_token=%1", GVAR(refresh_token)]
] call EFUNC(api,request);
