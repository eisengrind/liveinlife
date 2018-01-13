
lilc_locker_invClosedIndex = player addEventHandler [
    "InventoryClosed",
    {
        params [
            ["_unit", objNull, [objNull]],
            ["_targetContainer", objNull, [objNull]]
        ];

        player removeEventHandler ["InventoryClosed", lilc_locker_invClosedIndex];
        call lilc_locker_fnc_handleInventoryOpened;

        private _name = (_targetContainer getVariable ["lilc_locker_name", ""]);
        if (_name == "") exitWith {};

        private _g = ([_targetContainer] call lilc_inventory_fnc_getVehicleCargo);

        if !([lilc_locker_lockers, _name] call CBA_fnc_hashHasKey) exitWith {};

        [
            lilc_locker_lockers,
            _name,
            _g
        ] call CBA_fnc_hashSet;

        [
            _name,
            _g
        ] call lilc_locker_fnc_saveLocker;

        [_targetContainer] call lilc_inventory_fnc_clearVehicleCargo;
    }
];
