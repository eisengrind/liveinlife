#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_targetUnit", objNull, [objNull]],
    ["_garageAlias", "", [""]],
    ["_vehicleUUID", "", [""]]
];

if (isNull _unit) exitWith {};
if (isNull _targetUnit) exitWith {};
if (_garageAlias == "") exitWith {};
if (_vehicleUUID == "") exitWith {};

private _req = [_garageAlias] call EFUNC(api_garages,getGarageByAlias);

if REQ_IS_OK(_req) then {
    private _req = [_vehicleUUID, ] call EFUNC(api_vehicles,transferVehicle);

    if REQ_IS_OK(_req) then {
        [QGVAR(transferred), nil, _unit] call CBA_fnc_targetEvent;
        [QGVAR(transferReceived), nil, _targetUnit] call CBA_fnc_targetEvent;
    } else {
        [QGVAR(transferFailed), nil, _unit] call CBA_fnc_targetEvent;
    };
} else {
    [QGVAR(transferFailed), nil, _unit] call CBA_fnc_targetEvent;
};
