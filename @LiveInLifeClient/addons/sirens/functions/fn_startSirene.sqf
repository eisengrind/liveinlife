
params [
    ["_vehicle", objNull, [objNull]],
    ["_id", "", [""]],
    ["_sound", "", [""]],
    ["_timeout", 0, [0]],
    ["_loop", true, [false]]
];

if (isNull _vehicle) exitWith { false; };
if (isNil "_id" || { _id == ""; }) exitWith { false; };
if (isNil "_sound" || { _sound == ""; }) exitWith { false; };
if (_timeout <= 0) exitWith { false; };

if (_vehicle getVariable ["lilc_sirens_active", false]) exitWith { false; };
_vehicle setVariable ["lilc_sirens_active", true, true];

[[_vehicle, _id, _sound, _timeout, _loop], "lilc_sirens_fnc_startSireneLocal", -2, true] call lilc_common_fnc_send;
true;
