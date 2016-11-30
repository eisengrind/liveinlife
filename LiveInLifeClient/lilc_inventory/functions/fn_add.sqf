
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_classname", "", [""]],
    ["_local", false, [false]],
    ["_magazineSize", 1, [0]]
];

try {
    if (isNull _unit) throw false;
    if (_classname == "") throw false;

    private _itemType = [_classname] call BIS_fnc_itemType;
    private _enoughSpace = [_unit, _classname] call lilc_inventory_fnc_canAdd;

    if (_unit isKindOf "Man") then {
        private _status = true;
        switch (_itemType select 0) do {
            case "Weapon": {
                switch (true) do {
                    case ((_itemType select 1) in ["MissleLauncher", "RocketLauncher", "Launcher"]): {
                        if ((secondaryWeapon _unit) != "") then {
                            _status = ["Willst du wirklich deine derzeitige Waffe ersetzen?", "Waffe ersetzen?", "Ja", "Nein"] call BIS_fnc_guiMessage;
                        };
                    };

                    case ((_itemType select 1) == "Handgun"): {
                        if ((handgunWeapon _unit) != "") then {
                            _status = ["Willst du wirklich deine derzeitige Waffe ersetzen?", "Waffe ersetzen?", "Ja", "Nein"] call BIS_fnc_guiMessage;
                        };
                    };

                    default {
                        if ((primaryWeapon _unit) != "") then {
                            _status = ["Willst du wirklich deine derzeitige Waffe ersetzen?", "Waffe ersetzen?", "Ja", "Nein"] call BIS_fnc_guiMessage;
                        };
                    };
                };

                if (_status) then {
                    _unit addWeapon _classname;
                };
            };

            case "Item": {
                switch (_itemType select 1) do {
                    case "Binocular": {
                        if ((binocular _unit) == "") then {
                            _unit linkItem _classname;
                            _status = false;
                        };
                    };

                    case "NVGoggles": {
                        if ((hmd _unit) == "") then {
                            _unit linkItem _classname;
                        } else {
                            _unit unlinkItem _classname;
                            _unit removeItem _classname;
                            _unit linkItem _classname;
                        };
                        _status = false;
                    };
                };

                if ((!isNull _enoughSpace) && _status) then {
                    _unit addItem _classname;
                };
            };

            case "Equipment": {
                switch (_itemType select 1) do {
                    case "Glasses": {
                        _unit addGoggles _classname;                    
                        _status = false;
                    };

                    case "Headgear": {
                        _unit addHeadgear _classname;
                        _status = false;
                    };

                    case "Vest": {
                        _unit addVest _classname;
                        _status = false;
                    };

                    case "Uniform": {
                        _unit forceAddUniform _classname;
                        _status = false;
                    };

                    case "Backpack": {
                        private _backpackItems = backpackItems _unit;
                        _unit addBackpack _classname;
                        { if (_unit canAddItemToBackpack _classname) then { _unit addItemToBackpack _x; }; } forEach _backpackItems;
                    };
                };

                if ((!isNull _enoughSpace) && _status) then {
                    _unit addItem _classname;
                };
            };

            case "Magazine": {
                _unit addMagazine [_classname, _magazineSize];
            };

            case "Mine": {
                _unit addItem _classname;
            };
        };
    } else {
        if (!isNull _enoughSpace) then {
            switch (_itemType select 0) do {
                case "Weapon": {
                    if (_local) then {
                        _unit addWeaponCargo [_classname, 1];
                    } else {
                        _unit addWeaponCargoGlobal [_classname, 1];
                    };
                };

                case "Equipment": {
                    switch (_itemType select 1) do {
                        case "Backpack": {
                            if (_local) then {
                                _unit addBackpackCargo [_classname, 1];
                            } else {
                                _unit addBackpackCargoGlobal [_classname, 1];
                            };
                        };

                        default {
                            if (_local) then {
                                _unit addItemCargo [_classname, 1];
                            } else {
                                _unit addItemCargoGlobal [_classname, 1];
                            };
                        };
                    };
                };

                case "Magazine": {
                    if (_local) then {
                        _unit addMagazineCargo [_classname, 1];
                    } else {
                        _unit addMagazineCargoGlobal [_classname, 1];
                    };
                };

                case "Item": {
                    if (_local) then {
                        _unit addItemCargo [_classname, 1];
                    } else {
                        _unit addItemCargoGlobal [_classname, 1];
                    };
                };

                default {
                    if (_local) then {
                        _unit addItemCargo [_classname, 1];
                    } else {
                        _unit addItemCargoGlobal [_classname, 1];
                    };
                };
            };
        };
    };

    throw false;
} catch {
    _exception;
};
