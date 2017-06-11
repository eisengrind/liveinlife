
//ITEMS - [<classname>, <sellprice>, <buyprice>, <color>]
private _shopName = param [0, "", [""]];

try {
    private _shopArray = ([_shopName] call lilc_shops_fnc_getShopConfig);
    if ((count _shopArray) != 2) throw [];

    private _dealerIndex = -1;
    {
        if ((_x select 0) == _shopName) exitWith { _dealerIndex = _forEachIndex; };
    } forEach lils_economy_data;
    
    if (_dealerIndex == -1) throw [];
    
    
    private _economyItems = [];
    {
        _economyItems pushBack [(_x select 0), ((_x select 2) select 0), ((_x select 3) select 0), (_x select 1)];
    } forEach ((lils_economy_data select _dealerIndex) select 1);

    throw _economyItems;
} catch {
    _exception;
};
