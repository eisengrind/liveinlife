
params [
    ["_classname", "", [""]],
    ["_slot", 0, [0]]
];

try {
    private _config = [_classname] call lilc_inventory_fnc_getItemInfo;
    if (isNull _config) throw false;

    if (isArray(_config >> "allowedSlots")) then {
        if (_slot in getArray(_config >> "allowedSlots")) throw true;
    };

    if (isArray(_config >> "itemInfo" >> "allowedSlots")) then {
        if (_slot in getArray(_config >> "itemInfo" >> "allowedSlots")) throw true;
    };

    if (isArray(_config >> "weaponSlotsInfo" >> "allowedSlots")) then {
        if (_slot in getArray(_config >> "weaponSlotsInfo" >> "allowedSlots")) throw true;
    };

    if !(isArray(_config >> "weaponSlotsInfo" >> "allowedSlots") && isArray(_config >> "itemInfo" >> "allowedSlots") && _slot in getArray(_config >> "allowedSlots")) throw true;

    throw false;
} catch {
    _exception;
};
