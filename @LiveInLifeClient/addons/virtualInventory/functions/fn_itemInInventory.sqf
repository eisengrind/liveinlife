
params [
    ["_unit", objNull, [objNull]],
    ["_viClassname", "", [""]],
    ["_viName", nil, [""]],
    ["_viData", nil]
];

try {
    if (isNull _unit) throw false;

    private _itemConfig = ([_viClassname] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    private _nA = !(isNil "_viName");
    private _dA = !(isNil "_viData");

    {
        if (_viClassname isEqualTo (_x select 0) && !_nA && !_dA) throw true;
        if (
            _viClassname isEqualTo (_x select 0) &&
            !(isNil "_viName") && (_viName isEqualTo (_x select 1)) &&
            !_dA
        ) throw true;
        if (
            _viClassname isEqualTo (_x select 0) &&
            !(isNil "_viName") && (_viName isEqualTo (_x select 1)) &&
            !(isNil "_viData") && (_viData isEqualTo (_x select 2))
        ) throw true;
    } forEach (player getVariable ["lilc_virtualInventory_inventory", []]);

    throw false;
} catch {
    _exception;
};