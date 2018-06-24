
params [
    ["_vehicle", objNull, [objNull]],
    ["_id", "", [""]]
];

if (isNull _vehicle) exitWith {};
if (isNil "_id" || { _id == ""; }) exitWith {};

[_this, "lilc_sirens_fnc_stopSireneLocal", -2, true] call lilc_common_fnc_send;
