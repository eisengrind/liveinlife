#include "..\script_component.hpp"

params ["_profileID", "_opts"];

INFO(format[ARR_2(QUOTE(saving profile UID: %1),_profileID)]);

[
    _profileID,
    _opts
] call EFUNC(api_profiles,setProfile);

INFO(format[ARR_2(QUOTE(saved profile UID: %1), _profileID)]);
