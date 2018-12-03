#include "..\script_component.hpp"

[
    "users/auth",
    [],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    format["refresh_token=%1", GVAR(refresh_token)]
] call EFUNC(api,request);
