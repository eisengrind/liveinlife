
private _classname = param [0, "", [""]];

try {
    if (_classname == "") throw false;
    private _category = ([_classname] call lilc_shops_fnc_getCategory);

    if (_category in ["Weapon", "WeaponAccessory", "Item", "Mine", "Magazine"]) throw true;
    throw false;
} catch {
    _exception;
};
