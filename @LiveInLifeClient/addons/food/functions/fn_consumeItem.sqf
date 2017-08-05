
params [
    ["_classname", "", [""]],
    ["_hungerChange", 0, [0]],
    ["_thirstChange", 0, [0]]
];

private _classname = param [0, "", [""]];

try {
    if !([_classname] call lilc_inventory_fnc_haveItem) throw false;

    private _itemConfig = [_classname] call lilc_inventory_fnc_getItemInfo;
    if (isNull _itemConfig) throw false;

    if !([player, _classname] call lilc_inventory_fnc_remove) throw false;

    if !([_hungerChange] call lilc_food_fnc_changeHunger) throw false;
    if !([_thirstChange] call lilc_food_fnc_changeThirst) throw false;

    ["lilce_food_consumed", [_classname]] call CBA_fnc_localEvent;

    [(format["Du hast %1 konsumiert", getText(_itemConfig >> "displayName")])] call lilc_ui_fnc_hint;
    
    throw true;
} catch {
    _exception;
};
