
params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

try {
    if (isNull _vehicle) throw false;
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(isClass(configFile >> "CfgVehicles" >> (typeOf _vehicle))) throw false;
    
    private _keyClassname = (format["lilci_key_%1_F", (typeOf _vehicle)]);
    if !(isClass(configFile >> "CfgMagazines" >> _keyClassname)) throw false;

    private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
    if (_vehicleID <= 0) throw false;

    _unit addMagazine [_keyClassname, _vehicleID];
    throw true;
} catch {
    _exception;
};
