
private _itemID = param [0, 0, [0]];

try {
    if (_itemID <= 0) throw false;

    {
        if ((_x select 0) == _itemID) throw _x;
    } forEach lilc_virtualInventory_inventory;

    throw [];
} catch {
    _exception;
};
