
params [
    ["_unit", ObjNull, [ObjNull, []]],
    ["_classname", "", ["", []]],
    ["_ignoreItems", "", ["", []]]
];

try {
    if (_unit isEqualType ObjNull) then {
        if (isNull _unit) throw ObjNull;
        _unit = [_unit];
    };
    if ((count _unit) <= 0) throw ObjNull;
    if ((typeName _classname) == (typeName "")) then {
        if (_classname == "") throw ObjNull;
        _classname = [_classname];
    };
    if ((count _classname) <= 0) throw (_unit select 0);

    if (_ignoreItems isEqualType "") then {
        _ignoreItems = [_ignoreItems];
    };
    if ((count _ignoreItems) <= 0) throw (_unit select 0);

    private _objects = [];
    {
        if !(_x in _objects && !isNull _x) then {
            _objects pushBack _x;
        };
    } forEach _unit;

    {
        try {
            private _vehicle = _x;

            if (_vehicle isKindOf "Man") then {
                private _uniformConfig = [(uniform _vehicle)] call lilc_inventory_fnc_getItemInfo;
                private _vestConfig = [(vest _vehicle)] call lilc_inventory_fnc_getItemInfo;
                private _backpackConfig = [(backpack _vehicle)] call lilc_inventory_fnc_getItemInfo;

                private _maxUniformSpace = 0;
                private _maxVestSpace = 0;
                private _maxBackpackSpace = 0;

                private _uniformLoad = 0;
                private _vestLoad = 0;
                private _backpackLoad = 0;

                if !(isNull _uniformConfig) then {
                    _maxUniformSpace = getNumber(configFile >> "CfgVehicles" >> (getText(_uniformConfig >> "itemInfo" >> "containerClass")) >> "maximumLoad");
                    {
                        _uniformLoad = _uniformLoad + ([_x] call lilc_inventory_fnc_getItemWeight);
                    } forEach ((uniformItems _vehicle) - _ignoreItems);
                };

                if !(isNull _vestConfig) then {
                    _maxVestSpace = getNumber(configFile >> "CfgVehicles" >> (getText(_vestConfig >> "itemInfo" >> "containerClass")) >> "maximumLoad");
                    {
                        _vestLoad = _vestLoad + ([_x] call lilc_inventory_fnc_getItemWeight);
                    } forEach ((vestItems _vehicle) - _ignoreItems);
                };

                if !(isNull _backpackConfig) then {
                    _maxBackpackSpace = getNumber(_backpackConfig >> "maximumLoad");
                    {
                        _backpackLoad = _backpackLoad + ([_x] call lilc_inventory_fnc_getItemWeight);
                    } forEach ((backpackItems _vehicle) - _ignoreItems);
                };

                private _canAdd = false;
                {
                    private _weight = [_x] call lilc_inventory_fnc_getItemWeight;

                    if ((uniform _vehicle) != "") then {
                        if (([_x, 801] call lilc_inventory_fnc_haveSlot)) then {
                            if !(isNull _uniformConfig) then {
                                if ((_uniformLoad + _weight) <= _maxUniformSpace) then {
                                    _uniformLoad = _uniformLoad + _weight;
                                    _canAdd = true;
                                };
                            };
                        };
                    };

                    if ((vest _vehicle) != "") then {
                        if (([_x, 701] call lilc_inventory_fnc_haveSlot)) then {
                            if !(isNull _vestConfig) then {
                                if ((_vestLoad + _weight) <= _maxVestSpace) then {
                                    _vestLoad = _vestLoad + _weight;
                                    _canAdd = true;
                                };
                            };
                        };
                    };

                    if ((backpack _vehicle) != "") then {
                        if (([_x, 901] call lilc_inventory_fnc_haveSlot)) then {                
                            if !(isNull _backpackConfig) then {
                                if ((_backpackLoad + _weight) <= _maxBackpackSpace) then {
                                    _backpackLoad = _backpackLoad + _weight;
                                    _canAdd = true;
                                };
                            };
                        };
                    };

                    if !(_canAdd) throw ObjNull;
                } forEach _classname;

                if (_canAdd) throw _vehicle;
                throw objNull;
            } else {
                private _cargo = [];
                _cargo = ((_cargo + (itemCargo _vehicle) + (weaponCargo _vehicle) + (backpackCargo _vehicle) + (magazineCargo _vehicle)) - _ignoreItems);
                private _maximumLoad = 0;
                _maximumLoad = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "maximumLoad");
                
                private _currentLoad = 0;
                {
                    _currentLoad = _currentLoad + ([_x] call lilc_inventory_fnc_getItemWeight);
                } forEach _cargo;

                if (_currentLoad < _maximumLoad) then {
                    private _canAdd = true;
                    {
                        if ((([_x] call lilc_inventory_fnc_getItemWeight) + _currentLoad) > _maximumLoad) then { _canAdd = false; };
                    } forEach _classname;

                    if (_canAdd) throw _vehicle;
                };
            };
        } catch {
            if !(isNull _exception) throw _exception;
        };
    } forEach _objects;
    
    throw ObjNull;
} catch {
    _exception;
};
