
private _gear = param [0, [], [[]]];

try {
    [lilc_locker_currentContainer, _gear] call lilc_inventory_fnc_setVehicleCargo;
    throw true;
} catch {
    _exception;
};
