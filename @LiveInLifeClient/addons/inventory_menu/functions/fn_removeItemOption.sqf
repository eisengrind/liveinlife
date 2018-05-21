
params [
    ["_classname", "", [""]],
    ["_index", -1, [0]]
];

if (_classname == "") exitWith { false; };
if (_index <= -1) exitWith { false; };
if (isNull lilc_inventory_menu_logic_itemOptions) exitWith { false; };

private _hash = [_classname] call lilc_inventory_menu_fnc_getItemOptions;
lilc_inventory_menu_logic_itemOptions setVariable [_classname, [_hash, _index] call CBA_fnc_hashRem];
true;
