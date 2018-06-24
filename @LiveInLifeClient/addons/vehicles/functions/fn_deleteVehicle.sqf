
params [
    ["_vehicle", objNull, [objNull]]
];

{
    deleteVehicle _x;
} forEach attachedObjects _vehicle;
deleteVehicle _vehicle;
