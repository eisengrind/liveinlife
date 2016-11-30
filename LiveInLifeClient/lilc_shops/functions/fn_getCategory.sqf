
private _item = param [0, "", [""]];

try {
    if (isNil "_item") throw "";
    
    private _type = ([_item] call BIS_fnc_itemType);
    if ((count _type) <= 0) throw "";

    private _category = "";
    switch (_type select 0) do {
        case "Item": {
            switch (true) do {
                case ((_type select 1) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"]): {
                    _category = "WeaponAccessory";
                };

                default {
                    _category = "Item";
                };
            };
        };
        
        case "Equipment": {
            _category = (_type select 1);
        };

        default {
            _category = (_type select 0);
        };
    };

    /*
    Uniform-Shops:
        Glasses
        Headgear
        Vest
        Uniform
        Backpack

    Item-Shops:
        Weapon
        WeaponAccessory
        Item
        Mine
    */

    throw _category;
} catch {
    _exception;
};
