
params [
    ["_viClassname", "", [""]],
    ["_viNames", [], [[], ""]],
    ["_viData", nil]
];

try
{
    private _itemConfig = ([_viClassname] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    if (_viNames isEqualType "") then
    {
        _viNames = [_viNames];
    };

    if (isNil "lilc_virtualInventory_inventory") then
    {
        lilc_virtualInventory_inventory = [];
    };

    if ((count _viNames) == 0) then
    {
        _viNames = [(getText(_itemConfig >> "displayName"))];
    };

    lilc_virtualInventory_inventory pushback [
        _viClassname,
        _viNames,
        _viData
    ];

    throw true;
}
catch
{
    _exception;
};
