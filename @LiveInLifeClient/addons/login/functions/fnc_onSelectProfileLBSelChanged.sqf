#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_index"];

switch (_name) do {
    case QGVAR(select_profile): {
        private _profileID = _ctrl lbValue _index;
        if (_profileID > 0) then {
            ((ctrlParent _ctrl) displayCtrl 1101) ctrlSetStructuredText parseText "<t size=""0.7""><t size=""1"">Profile Info:</t><br /> fetching profile information.";

            private _resp = [_profileID] call EFUNC(api_profiles,getProfile);

            ((ctrlParent _ctrl) displayCtrl 1101) ctrlSetStructuredText parseText (if (count _resp == 2 && { _resp select 1 == 200} && { count (_resp select 0) == 2 }) then {
                private _profile = _resp select 0;
                format[
                    "<t size=""0.7""><t size=""1"">Profile Info:</t><br /> Firstname: %1<br /> Lastname: %2<br /> Sex: %3<br /> Cash: $%4<br /> Status: %5</t>",
                    [_profile, "firstname"] call a3uf_json_fnc_get,
                    [_profile, "lastname"] call a3uf_json_fnc_get,
                    (if (([_profile, "sex"] call a3uf_json_fnc_get) == 0) then { "Male"; } else { "Female"; }),
                    [_profile, "cash"] call a3uf_json_fnc_get,
                    (if ([_profile, "active"] call a3uf_json_fnc_get) then { "Active"; } else { "Disabled"; })
                ];
            } else {
                "<t size=""0.7""><t size=""1"">Profile Info:</t><br /> could not fetch profile data.";
            });
        };
    };
};
