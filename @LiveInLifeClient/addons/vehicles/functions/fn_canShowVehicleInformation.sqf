
params [
    ["_vehicle", objNull, [objNull]]
];

(
    ([player] call lilc_common_fnc_isAlive) &&
    !(isNull _vehicle) &&
    (alive _vehicle) &&
    ([_vehicle] call lilc_vehicles_fnc_isHiveVehicle) &&
    ([_vehicle, lilc_vehicles_informationVehicles] call lilc_common_fnc_isKindOf)
);
