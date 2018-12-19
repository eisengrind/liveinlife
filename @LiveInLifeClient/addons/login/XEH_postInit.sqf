#include "script_component.hpp"

[QGVAR(userCreated), {
    params [
        ["_userID", 0, [0]],
        ["_accessToken", "", [""]],
        ["_refreshToken", "", [""]]
    ];

    [QEGVAR(api_users,userAuthenticated), [_accessToken, _refreshToken]] call CBA_fnc_localEvent;

    private _resp = [10, 1, [
        ["user_id", _userID]
    ]] call EFUNC(api_profiles,getProfiles);

    if REQ_IS_OK(_resp) then {
        private _res = REQ_GET_BODY(_resp);

        if (count _res == 2) then {
            if (count (_res select 1) == 0) then {
                createDialog QGVAR(create_profile);
            };
        } else {
            createDialog QGVAR(create_profile);
        };
    };
}] call CBA_fnc_addEventHandler;
