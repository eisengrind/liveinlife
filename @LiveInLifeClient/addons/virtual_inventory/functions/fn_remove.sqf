
params [
    ["_unit", objNull, [objNull]],
    ["_viClassname", "", [""]],
    ["_viData", nil]
];

try {
    if (isNull _unit) throw false;
    
    private _itemConfig = ([_viClassname] call lilc_virtual_inventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    private _inv = (_unit getVariable ["lilc_virtual_inventory_inventory", []]);
    {
        if (
            _viClassname isEqualTo (_x select 0) &&
            _viData isEqualTo (_x select 2)
        ) then
        {
            _inv deleteAt _forEachIndex;
            _unit setVariable ["lilc_virtual_inventory_inventory", _inv, true];
            throw true;
        };
    } forEach _inv;

    throw false;
} catch {
    _exception;
};
