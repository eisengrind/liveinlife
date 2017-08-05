
params [
    ["_unit", objNull, [objNull]],
    ["_classname", "", [""]],
    ["_magazineSize", -1, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_classname == "") throw false;

    while { !([_unit, _classname] call lilc_inventory_fnc_canAdd) } do {
        private _items = ((items _x) + (assignedItems _x) + (weapons _x) + (magazineCargo _x));
        private _smallestIndex = [([(_items select 0)] call lilc_inventory_fnc_getItemWeight), 0];
        {
            private _weight = ([_x] call lilc_inventory_fnc_getItemWeight);
            if (_weight < (_smallestIndex select 0)) then {
                _smallestIndex = [_weight, _forEachIndex];
            };
        } forEach _items;

        if ([_unit, _classname] call lilc_inventory_fnc_canAdd) exitWith {};
        [_unit, (_items select (_smallestIndex select 1))] call lilc_inventory_fnc_remove;
    };

    [_unit, _classname, false, _magazineSize] call lilc_inventory_fnc_add;
} catch {
    _exception;
};
