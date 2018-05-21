
//TODO: change general VI-system...

params [
    ["_unit", objNull, [objNull]],
    ["_viClassname", "", [""]],
    ["_viName", "", [""]], //Just use the displayName
    ["_viData", nil]
];

try
{
    if (isNull _unit) throw false;

    private _itemConfig = ([_viClassname] call lilc_virtual_inventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    if (_viName == "") then
    {
        _viName = (getText(_itemConfig >> "displayName"));
    };

    private _inv = (_unit getVariable ["lilc_virtual_inventory_inventory", []]);

    _inv pushBack [
        _viClassname,
        _viName,
        _viData
    ];

    _unit setVariable ["lilc_virtual_inventory_inventory", _inv, true];

    throw true;
}
catch
{
    _exception;
};
