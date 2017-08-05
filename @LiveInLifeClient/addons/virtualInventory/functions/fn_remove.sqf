
params [
    ["_unit", objNull, [objNull]],
    ["_viClassname", "", [""]],
    ["_viName", "", [""]],
    ["_viData", nil]
];

try {
    if (isNull _unit) throw false;
    
    private _itemConfig = ([_viClassname] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    private _inv = (_unit getVariable ["lilc_virtualInventory_inventory", []]);
    {
        if (
            _viClassname isEqualTo (_x select 0) &&
            (
                (_viName isEqualTo (_x select 1) && !(_viName isEqualTo "")) ||
                (_viName isEqualTo getText(_itemConfig >> "displayName"))
            ) &&
            _viData isEqualTo (_x select 2)
        ) then
        {
            _inv deleteAt _forEachIndex;
            _unit setVariable ["lilc_virtualInventory_inventory", _inv, true];
            throw true;
        };
    } forEach _inv;

    throw false;
} catch {
    _exception;
};
