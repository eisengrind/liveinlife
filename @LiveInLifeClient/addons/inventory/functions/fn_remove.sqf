
params [
    ["_unit", ObjNull, [ObjNull, []]],
    ["_classname", "", [""]]
];

try {
    if (_unit isEqualType ObjNull) then {
        if (isNull _unit) throw false;
        _unit = [_unit];
    };

    if (_classname == "") throw false;
    
    _itemType = [_classname] call BIS_fnc_itemType;

    {
        private _vehicle = _x;

        if (_vehicle isKindOf "Man") then {
            if (([_classname, _vehicle] call lilc_inventory_fnc_itemCount) > 0) then {
                switch (_itemType select 0) do {
                    case "Weapon": {
                        _vehicle removeWeapon _classname;
                        throw true;
                    };

                    case "Item": {
                        _vehicle removeItem _classname;
                        throw true;
                    };

                    case "Equipment": {
                        switch (_itemType select 1) do {
                            case "Backpack": {
                                removeBackpack _vehicle;
                                throw true;
                            };

                            default {
                                _vehicle removeItem _classname;
                                throw true;
                            };
                        };
                    };

                    case "Magazine": {
                        _vehicle removeMagazine _classname;
                        throw true;
                    };

                    case "Mine": {
                        _vehicle removeItem _classname;
                        throw true;
                    };
                };
            };
        } else {
            if (([_classname, _vehicle] call lilc_inventory_fnc_itemCount) > 0) then {
                private _vehicleInventory = [_vehicle] call lilc_inventory_fnc_getVehicleCargo;
                private _vehicleInventoryCopy = _vehicleInventory;

                if ((count _vehicleInventory) > 0) then {
                    {
                        if (_classname == _x) then {
                            ((_vehicleInventory select 0) select 1) set [_forEachIndex, ((((_vehicleInventory select 0) select 1) select _forEachIndex) - 1)];
                            [_vehicle, _vehicleInventory] call lilc_inventory_fnc_setVehicleCargo;
                            throw true;
                        };
                    } forEach ((_vehicleInventoryCopy select 0) select 0);

                    {
                        if (_classname == (_x select 0)) then {
                            (_vehicleInventory select 1) set [_forEachIndex, ["", -1]];
                            [_vehicle, _vehicleInventory] call lilc_inventory_fnc_setVehicleCargo;
                            throw true;
                        };
                    } forEach (_vehicleInventoryCopy select 1);

                    {
                        if (_classname == _x) then {
                            ((_vehicleInventory select 2) select 1) set [_forEachIndex, ((((_vehicleInventory select 2) select 1) select _forEachIndex) - 1)];
                            [_vehicle, _vehicleInventory] call lilc_inventory_fnc_setVehicleCargo;
                            throw true;
                        };
                    } forEach ((_vehicleInventoryCopy select 2) select 0);

                    /*
                    private _backpacks = (_vehicleInventoryCopy select 3);
                    {
                        private _backpack = (_x select 0);
                        if ((_c))
                    } forEach _backpacks;
                    
                    {
                        if (_classname == _x) then {
                            ((_vehicleInventory select 3) select 1) set [_forEachIndex, ((((_vehicleInventory select 3) select 1) select _forEachIndex) - 1)];
                            [_vehicle, _vehicleInventory] call lilc_inventory_fnc_setVehicleCargo;
                            throw true;
                        };
                    } forEach ((_vehicleInventoryCopy select 3) select 0);
                    */
                };
            };
        };
    } forEach _unit;
    
    //if (_itemCount == ([_classname, _unit] call lilc_inventory_fnc_itemCount)) throw false;
    throw false;
} catch {
    _exception;
};
