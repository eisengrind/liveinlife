
try {
    private _shopName = lilc_shops_currentShopname;
    private _shopInfo = [];
    {
        if ((_x select 0) == _shopName) exitWith {
            _shopInfo = (_x select 1);
        };
    } forEach lils_economy_data;

    if ((count _shopInfo) <= 0) throw false;

    lbClear 1251;
    private _unitItems = ([player] call lilc_inventory_fnc_getAllUnitItems);
    {
        private _classname = (_x select 0);
        //private _color = (_x select 1);
        private _sellPrice = ((_x select 2) select 0);
        private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
        
        if !(isNull _itemConfig) then {
            private _index = (lbAdd [1251, format["%1 (%2 $)", getText(_itemConfig >> "displayName"), _sellPrice]]);
            lbSetValue [1251, _index, _sellPrice];
            lbSetData [1251, _index, _classname];

            if (_classname in _unitItems) then {
                lbSetColor [1251, _index, [1, 1, 1, 1]];
            } else {
                lbSetColor [1251, _index, [1, 0, 0, 1]];
            };
        };
    } forEach _shopInfo;

    throw true;
} catch {
    _exception;
};
