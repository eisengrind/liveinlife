
params [
    ["_vehicle", objNull, [objNull]],
    ["_classname", "", [""]],
    ["_magazineSize", 0, [0]],
    ["_dropAllowed", true, [false]]
];

try {
    if (isNull _vehicle) throw false;
    if (_vehicle isKindOf "Man") then {
        [_vehicle, _classname, _magazineSize, false, _dropAllowed] call lilc_inventory_fnc_add;
        throw false;
    };
    if (_classname == "") throw false;
    
    private _itemType = ([_classname] call BIS_fnc_itemType);
    private _enoughSpace = ([_vehicle, _classname] call lilc_inventory_fnc_canAdd);
    if (isNull _enoughSpace) then { _enoughSpace = false; } else { _enoughSpace = true; };

    switch (_itemType select 0) do {
        case "Weapon": {
            if (_enoughSpace) then {
                _vehicle addWeaponCargoGlobal [_classname, 1];
            } else {
                if (_dropAllowed) then {
                    [(getPosASL _vehicle), [_classname]] call lilc_inventory_fnc_groundItems;
                };
            };
        };

        case "Item": {
            if (_enoughSpace) then {
                _vehicle addItemCargoGlobal [_classname, 1];
            } else {
                if (_dropAllowed) then {
                    [(getPosASL _vehicle), [_classname]] call lilc_inventory_fnc_groundItems;
                };
            };
        };

        case "Equipment": {
            if (_enoughSpace) then {
                _vehicle addItemCargoGlobal [_classname, 1];
            } else {
                if (_dropAllowed) then {
                    [(getPosASL _vehicle), [_classname]] call lilc_inventory_fnc_groundItems;
                };
            };
        };

        case "Magazine": {
            if (_enoughSpace) then {
                _vehicle addMagazineCargoGlobal [_classname, 1];
            } else {
                if (_dropAllowed) then {
                    [(getPosASL _vehicle), [_classname]] call lilc_inventory_fnc_groundItems;
                };
            };
        };

        case "Mine": {
            if (_enoughSpace) then {
                _vehicle addItemCargoGlobal [_classname, 1];
            } else {
                if (_dropAllowed) then {
                    [(getPosASL _vehicle), [_classname]] call lilc_inventory_fnc_groundItems;
                };
            };
        };
        
        default {
            throw false;
        };
    };

    throw true;
} catch {
    _exception;
};
