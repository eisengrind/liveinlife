
params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

if !([_unit] call lilc_common_fnc_isAlive) exitWith {};
if (isNull _vehicle) exitWith {};
if !([_vehicle] call lilc_vehicles_fnc_isHiveVehicle) exitWith {};

private _vehicleInformations = [];
_vehicleInformations = ([(format[
    "SELECT ACCOUNT_DATA.FIRSTNAME, ACCOUNT_DATA.LASTNAME, QUOTE(VEHICLES_DATA.PLATE) FROM ACCOUNT_DATA, VEHICLES_DATA WHERE VEHICLES_DATA.ID = '%1' AND ACCOUNT_DATA.ID = VEHICLES_DATA.ACCOUNTID",
    (_vehicle getVariable ["lilc_vehicleID", 0])
])] call lils_database_fnc_fetchObjects);

if ((count _vehicleInformations) != 1) exitWith {};
_vehicleInformations = (_vehicleInformations select 0);

if ((count _vehicleInformations) != 3) exitWith {};

[
    [
        _vehicleInformations
    ],
    "lilc_vehicles_fnc_setVehicleInformation",
    _unit
] call lilc_common_fnc_send;
