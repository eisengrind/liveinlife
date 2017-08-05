
lbClear 1407;
{
    private _index = lbAdd [1407, (_x select 1)];
    lbSetData [1407, _index, (str _x)];
} forEach (player getVariable ["lilc_virtualInventory_inventory", []]);
