
params [
    ["_vehicle", objNull, [objNull]]
];

if !([_vehicle] call lilc_vehicles_fnc_canShowVehicleInformation) exitWith {};
if !(createDialog "lilcm_vehicleInformation") exitWith {};

for "_i" from 1002 to 1005 do
{
    ctrlShow [_i, false];
};

[
    [
        player,
        _vehicle
    ],
    "lils_vehicles_fnc_getVehicleInformation"
] call lilc_common_fnc_sendToServer;
