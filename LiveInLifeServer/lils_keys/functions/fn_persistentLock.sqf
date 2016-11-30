
params [
    ["_vehicle", objNull, [objNull]],
    ["_lock", false, [false]]
];

try {
    if (isNull _vehicle) throw false;
    if !(isClass (configFile >> "CfgVehicles" >> (typeOf _vehicle))) throw false;

    _vehicle lock _lock;
} catch {
    _exception;
};
