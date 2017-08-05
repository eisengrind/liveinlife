
params [
    ["_classname", "", [""]],
    ["_vehicleID", 0, [0]]
];

try {
    if (_classname == "") throw false;
    if (_vehicleID <= 0) throw false;

    if !([
        player,
        "lilcvi_key_F",
        (format["Key %1", getText(configFile >> "CfgVehicles" >> _classname >> "displayName")]),
        _vehicleID
    ] call lilc_virtualInventory_fnc_remove) throw false;

    throw true;
} catch {
    _exception;
};
