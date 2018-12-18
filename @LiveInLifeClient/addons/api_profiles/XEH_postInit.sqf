#include "script_component.hpp"

[QGVAR(profileAuthenticated), {
    params [
        ["_accessToken", "", [""]],
        ["_refreshToken", "", [""]]
    ];

    GVAR(token) = _accessToken;
    GVAR(refresh_token) = _refreshToken;
}] call CBA_fnc_addEventHandler;

[{ GVAR(token) != "" && GVAR(refresh_token) != "" }, {
    [{
        [QGVAR(updateToken)] spawn CBA_fnc_localEvent;
    }, ACCESS_TOKEN_EXPIRY - 15] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

[QGVAR(updateToken), {
    private _resp = call FUNC(refreshProfileToken);
    if REQ_IS_OK(_resp) then {
        private _res = _resp select 0;
        GVAR(token) = [_res, "access_token"] call a3uf_json_fnc_get;
        GVAR(refresh_token) = [_res, "refresh_token"] call a3uf_json_fnc_get;
    };
}] call CBA_fnc_addEventHandler;
