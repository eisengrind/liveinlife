
{
    private _boxClassname = getText(_x >> "boxClassname");
    private _boxPosition = getArray(_x >> "boxPosition");
    if (_boxClassname != "" && (count _boxPosition) == 2 && (configName _x) != "") then {
        private _box = _boxClassname createVehicleLocal [0, 0, 0];
        _box allowDamage false;

        if !(isNull _box) then {
            _box setVariable ["lilc_lockerName", (configName _x)];
            [_box, _boxPosition] call lilc_common_fnc_setPosition;
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgLockers"));

player addEventHandler ["InventoryClosed", {
    _this call lilc_locker_fnc_onInventoryClosed;
}];
//(_this call lilc_locker_fnc_onInventoryOpened);
lilc_locker_onInventoryOpenedIndex = (player addEventHandler ["InventoryOpened", {
    (_this call lilc_locker_fnc_onInventoryOpened);
}]);
