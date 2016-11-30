
params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]],
    ["_secondaryContainer", objNull, [objNull]]
];

try {
    if !(local _container) throw false;

    private _lockerName = (_container getVariable ["lilc_lockerName", ""]);
    if (_lockerName == "") throw false;

    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    if (lilc_locker_onInventoryOpenedIndex <= -1) then { 
        lilc_locker_onInventoryOpenedIndex = (player addEventHandler ["InventoryOpened", {
            (_this call lilc_locker_fnc_onInventoryOpened);
        }]);
    };

    [[player, lilc_locker_currentID, _lockerName, ([_container] call lilc_inventory_fnc_getVehicleCargo)], "lils_locker_fnc_save"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
