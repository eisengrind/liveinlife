
private _item = param [0, "", [""]];

try {
    if (_item == "") throw "";

    private _category = "";

    switch (_item) do {
        case "no_glasses": { _category = "Glasses"; };
        case "no_headgear": { _category = "Headgear"; };
        case "no_vest": { _category = "Vest"; };
        case "no_uniform": { _category = "Uniform"; };
        case "no_backpack": { _category = "Backpack"; };
    };

    if (_category != "") throw _category;
    
    private _type = ([_item] call BIS_fnc_itemType);
    if ((count _type) <= 0) throw "";

    switch (_type select 0) do {
        case "Item": {
            switch (true) do {
                case ((_type select 1) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"]): { _category = "WeaponAccessory"; };
                case ((_type select 1) == "NVGoggles"): { _category = "NVGoggles"; };
                case ((_type select 1) == "Binocular") : { _category = "Binocular"; };

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
