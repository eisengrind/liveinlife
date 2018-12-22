#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_display"];

_resp = [EGVAR(api_users,token_user_id)] call EFUNC(api_users,getUser);

if (count _resp == 2 && { _resp select 1 == 200 }) then {
    (_display displayCtrl 1100) ctrlSetStructuredText parseText format[
        "<t size=""0.7""><t size=""1"">Current User:</t><br /> SteamID64: <a valign=""middle"" underline=""true"" color=""#FF6600"" href=""http://steamcommunity.com/profiles/%1"">%1</a><br /> Username: %2<br /> Email: %3</t>",
        [(_resp select 0), "steamid64"] call a3uf_json_fnc_get,
        [(_resp select 0), "username"] call a3uf_json_fnc_get,
        [(_resp select 0), "email"] call a3uf_json_fnc_get
    ];
} else {
    (_display displayCtrl 1100) ctrlSetStructuredText parseText format[
        "<t size=""0.7""><t size=""1"">Current User:</t><br /> could not fetch user info...</t>"
    ];
};

_resp = [
    10,
    1,
    [
        ["user_id", EGVAR(api_users,token_user_id)]
    ]
] call EFUNC(api_profiles,getProfiles);

lbClear 1500;
if (count _resp == 2 && { _resp select 1 == 200 } && { count (_resp select 0) == 2 }) then {
    private _profiles = _resp select 0 select 1;
    for "_i" from 0 to (count _profiles) - 1 do {
        private _profile = _profiles select _i;
        _index = lbAdd [
            1500,
            format [
                "%1 %2",
                [_profile, "firstname"] call a3uf_json_fnc_get,
                [_profile, "lastname"] call a3uf_json_fnc_get
            ]
        ];
        lbSetValue [
            1500,
            _index,
            [_profile, "id"] call a3uf_json_fnc_get
        ];
    };
} else {
    lbAdd [
        1500,
        "Could not fetch profiles."
    ];
};


