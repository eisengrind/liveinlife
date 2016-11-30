
params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]],
    ["_secondaryContainer", objNull, [objNull]]
];

try {
    if (isNull _container || !alive _container) throw false;
    if !(local _container) throw false;

    private _lockerName = (_container getVariable ["lilc_lockerName", ""]);
    if (_lockerName == "") throw false;

    lilc_locker_currentID = 0;
    lilc_locker_inventoryLoaded = 0;
    lilc_locker_currentContainer = objNull;
    lilc_locker_currentContainer = _container;

    [lilc_locker_currentContainer] call lilc_inventory_fnc_clearVehicleCargo;
    if !([_lockerName] call lilc_locker_fnc_openMenu) throw false;
    throw true;
} catch {
    _exception;
};
