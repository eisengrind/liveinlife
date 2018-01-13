
private _classname = param [0, "", [""]];

try {
    if (_classname == "") throw configNull;
    private _itemType = [_classname] call BIS_fnc_itemType;
    private _config = "";
    switch (_itemType select 0) do {
        case "Weapon": {
            _config = "CfgWeapons";
        };

        case "Item": {
            _config = "CfgWeapons";
        };

        case "Equipment": {
            switch (_itemType select 1) do {
                case "Glasses": {
                    _config = "CfgGlasses";
                };

                case "Backpack": {
                    _config = "CfgVehicles";
                };

                default {
                    _config = "CfgWeapons";
                };
            };
        };

        case "Magazine": {
            _config = "CfgMagazines";
        };
    };

    if !(isClass(configFile >> _config >> _classname)) throw configNull;
    throw (configFile >> _config >> _classname);
} catch {
    _exception;
};
