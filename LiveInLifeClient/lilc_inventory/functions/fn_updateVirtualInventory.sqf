
if (isNil "lilc_virtualInventory_inventory") then { lilc_virtualInventory_inventory = []; };
lbClear 1407;
{
    private _index = lbAdd [1407, ((_x select 1) select 0)];
    lbSetTooltip [1407, _index, ((_x select 1) select 1)];
    lbSetData [1407, _index, (str _x)];
} forEach lilc_virtualInventory_inventory;
