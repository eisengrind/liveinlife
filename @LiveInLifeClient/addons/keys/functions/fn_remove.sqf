
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
        _vehicleID
    ] call lilc_virtual_inventory_fnc_remove) throw false;

    throw true;
} catch {
    _exception;
};
