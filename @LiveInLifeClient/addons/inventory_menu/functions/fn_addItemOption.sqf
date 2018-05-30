
params [
    ["_classname", "", [""]],
    ["_condition", {}, [{}]],
    ["_statement", {}, [{}]]
];

private _classnameCfg = [_classname] call lilc_common_fnc_getClassnameConfig;
if (isNil "_classname") exitWith { -1; };
if (isNil "_condition") exitWith { -1; };

if (isNull lilc_inventory_menu_logic_itemOptions) exitWith { -1; };

private _hash = [_classname] call lilc_inventory_menu_fnc_getItemOptions;
private _keys = [_hash] call CBA_fnc_hashKeys;

private _i = 0;
while { _i in _keys } do {
    _i = _i + 1;
};

lilc_inventory_menu_logic_itemOptions setVariable [_classname, [_hash, _i, [_condition, _statement]] call CBA_fnc_hashSet];
_i;
