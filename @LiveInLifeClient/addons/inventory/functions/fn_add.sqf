
params [
    ["_unit", objNull, [objNull]],
    ["_classname", "", [""]],
    ["_magazineValue", 0, [0]],
    ["_force", false, [false]], //currently only work for weapons (e.g. Rifles, Binoculars, Vests, Backpacks, ...)
    ["_dropAllowed", false, [false]]
];

try
{
    if (isNull _unit) throw false;
    if (_classname == "") throw false;

    private _itemType = [_classname] call BIS_fnc_itemType;
    private _enoughSpace = [_unit, _classname] call lilc_inventory_fnc_canAdd;
    
    switch (_itemType select 0) do
    {
        case "Weapon":
        {
            try
            {
                switch (true) do
                {
                    case ((_itemType select 1) in ["MissleLauncher", "RocketLauncher", "Launcher"]):
                    {
                        if ((secondaryWeapon _unit) == "") throw true;
                        throw false;
                    };
                    
                    case ((_itemType select 1) == "Handgun"):
                    {
                        if ((handgunWeapon _unit) == "") throw true;
                        throw false;
                    };

                    default
                    {
                        if ((primaryWeapon _unit) == "") throw true;
                        throw false;
                    };
                };
            }
            catch
            {
                if (_exception) then
                {
                    _unit addWeapon _classname;
                    throw true;
                }
                else
                {
                    if (_force) then
                    {
                        _unit removeWeapon (secondaryWeapon _unit);
                        _unit addWeapon _classname;
                        throw true;
                    }
                    else
                    {
                        if (_dropAllowed) then
                        {
                            [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                            throw true;
                        };
                    };
                };
            };
        };

        case "Item":
        {
            try
            {
                switch (_itemType select 1) do 
                {
                    case "Binocular":
                    {
                        if ((binocular _unit) == "") then
                        {
                            _unit linkItem _classname;
                            throw true;
                        };
                        throw false;
                    };

                    case "NVGoggles":
                    {
                        if ((hmd _unit) == "") then
                        {
                            _unit linkItem _classname;
                            throw true;
                        };
                        throw false;
                    };

                    default
                    {
                        if (!isNull _enoughSpace) then
                        {
                            _unit addItem _classname;
                            throw true;
                        };

                        throw false;
                    };
                };
            }
            catch
            {
                if (_exception) then
                {
                    throw true;
                }
                else
                {
                    if (!_exception && _dropAllowed) then
                    {
                        [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                        throw true;
                    };

                    throw false;
                };
            };
        };

        case "Equipment":
        {
            switch (_itemType select 1) do
            {
                case "Glasses":
                {
                    if ((goggles _unit) == "") then
                    {
                        _unit addGoggles _classname;
                        throw true;
                    }
                    else
                    {
                        if (_force) then
                        {
                            removeGoggles _unit;
                            _unit addGoggles _classname;
                            throw true;
                        }
                        else
                        {
                            if (!isNull _enoughSpace) then
                            {
                                _unit addItem _classname;
                                throw true;
                            }
                            else
                            {
                                if (_dropAllowed) then
                                {
                                    [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                                    throw true;
                                };
                            };
                        };
                    };

                    throw false;
                };
                
                case "Headgear":
                {
                    if ((headgear _unit) == "") then
                    {
                        _unit addHeadgear _classname;
                        throw true;
                    }
                    else
                    {
                        if (_force) then
                        {
                            removeHeadgear _unit;
                            _unit addHeadgear _classname;
                            throw true;
                        }
                        else
                        {
                            if (!isNull _enoughSpace) then
                            {
                                _unit addItem _classname;
                                throw true;
                            }
                            else
                            {
                                if (_dropAllowed) then
                                {
                                    [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                                    throw true;
                                };
                            };
                        };
                    };

                    throw false;
                };

                case "Vest":
                {
                    if ((vest _unit) == "") then
                    {
                        _unit addVest _classname;
                        throw true;
                    }
                    else
                    {
                        if (_force) then
                        {
                            private _vestContent = ([player] call lilc_inventory_fnc_getVestInventory);
                            removeVest _unit;
                            _unit addVest _classname;
                            [player, _vestContent] call lilc_inventory_fnc_setVestInventory;
                            throw true;
                        }
                        else
                        {
                            if (_dropAllowed) then
                            {
                                [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                                throw true;
                            };
                        };
                    };
                };

                case "Uniform":
                {
                    if ((uniform _unit) == "") then
                    {
                        _unit forceAddUniform _classname;
                        throw true;
                    }
                    else
                    {
                        if (_force) then
                        {
                            private _uniformContent = ([player] call lilc_inventory_fnc_getUniformInventory);
                            removeUniform _unit;
                            _unit forceAddUniform _classname;
                            [player, _uniformContent] call lilc_inventory_fnc_setUniformInventory;
                            throw true;
                        }
                        else
                        {
                            if (_dropAllowed) then
                            {
                                [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                                throw true;
                            };
                        };
                    };
                };

                case "Backpack":
                {
                    if ((backpack _unit) == "") then
                    {
                        _unit addBackpack _classname;
                        throw true;
                    }
                    else
                    {
                        if (_force) then
                        {
                            private _backpackContent = ([player] call lilc_inventory_fnc_getBackpackInventory);
                            removeBackpack _unit;
                            _unit addBackpack _classname;
                            [player, _backpackContent] call lilc_inventory_fnc_setBackpackInventory;
                            throw true;
                        }
                        else
                        {
                            if (_dropAllowed) then
                            {
                                [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                                throw true;
                            };
                        };
                    };
                };
            };
        };

        case "Magazine":
        {
            if !(isNull _enoughSpace) then
            {
                _unit addMagazine _classname;
                throw true;
            }
            else
            {
                if (_dropAllowed) then
                {
                    [(getPosASL player), [_classname]] call lilc_inventory_fnc_groundItems;
                    throw true;
                };
            };
        };

        case "Mine":
        {
            _unit addItem _classname;
            throw false;
        };
    };

    throw false;
}
catch
{
    _exception;
};
