
private _classname = param [0, "", [""]];

try {
    if (_classname == "") throw 0;

    private _config = [_classname] call lilc_inventory_fnc_getItemInfo;
    if (isNumber(_config >> "mass")) then {
        throw getNumber(_config >> "mass");
    };

    if (isNumber(_config >> "itemInfo" >> "mass")) then {
        throw getNumber(_config >> "itemInfo" >> "mass");
    };

    if (isNumber(_config >> "weaponSlotsInfo" >> "mass")) then {
        throw getNumber(_config >> "weaponSlotsInfo" >> "mass");
    };

    throw 0;
} catch {
    _exception;
};
