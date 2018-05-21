
params [
    ["_classname", "", [""]]
];

private _hash = lilc_inventory_menu_logic_itemOptions getVariable [_classname, []];
if !([_hash] call CBA_fnc_isHash) then {
    _hash = [[], []] call CBA_fnc_hashCreate;
};
_hash;
