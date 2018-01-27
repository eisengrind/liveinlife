
params [
    ["_vehicle", objNull, [objNull]],
    ["_status", 0, [0, false]],
    ["_receiving", false, [false]]
];

if (isNull _vehicle) exitWith {};
if (local _vehicle) then {

} else {
    if (_receiving) then {
        _vehicle lock _status;
    } else {
        [[_vehicle, _status], "lilc_vehicles_fnc_lock", 0] call lilc_common_fnc_send;
    };
};
