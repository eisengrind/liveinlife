
params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

try {
    if (isNull _vehicle) throw false;
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((typeOf _vehicle) == "") throw false;

    
    private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
    if (_vehicleID <= 0) throw false;

    if !([
        player,
        "lilcvi_key_F",
        (format["Key %1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]),
        _vehicleID
    ] call lilc_virtualInventory_fnc_add) throw false;

    throw true;
} catch {
    _exception;
};
