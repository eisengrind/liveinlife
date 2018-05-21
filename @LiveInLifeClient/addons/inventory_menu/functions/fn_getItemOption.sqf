
params [
    ["_classname", "", [""]],
    ["_index", -1, [0]]
];

if (_index <= -1) exitWith { []; };
[[_classname] call lilc_inventory_menu_fnc_getItemOptions, _index] call CBA_fnc_hashGet;
