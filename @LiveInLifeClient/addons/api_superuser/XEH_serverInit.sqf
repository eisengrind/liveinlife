#include "script_component.hpp"

[] spawn {
    private _resp = [
        GVAR(username),
        GVAR(passwordBase64)
    ] call EFUNC(api_users,getUserToken);

    if REQ_IS_OK(_resp) then {
        private _res = REQ_GET_BODY(_resp);
        EGVAR(token) = [_res, "access_token"] call a3uf_json_fnc_get;
        EGVAR(refresh_token) = [_res, "refresh_token"] call a3uf_json_fnc_get;
    } else {
        LOG(could not fetch superuser tokens);
    };
};

diag_log format["canSuspend in Post-init?: %1", canSuspend];
