
private _classname = param [0, "", [""]];

try {
    if (_classname == "") throw false;
    private _category = ([_classname] call lilc_shops_fnc_getCategory);

    if (_category in ["Glasses", "Headgear", "Vest", "Uniform", "Backpack"]) throw true;
    throw false;
} catch {
    _exception;
};
