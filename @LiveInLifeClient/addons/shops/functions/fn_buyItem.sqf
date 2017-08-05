
try {
    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    ctrlEnable [1211, false];
    private _uiListShoppingCartItems = (_ui displayCtrl 1209);

    private _sum = 0;
    for "_i" from 0 to ((lbSize _uiListShoppingCartItems) - 1) do {
        private _data = (call compile (_uiListShoppingCartItems lbData _i));
        _sum = _sum + ((_data select 2) * (_uiListShoppingCartItems lbValue _i));
    };

    if !([_sum] call lilc_cash_fnc_have) then {
        ["Du hast nicht genügend Geld!", "ERROR"] call lilc_ui_fnc_hint; 
        throw false;
    };
    if !([player, _sum] call lilc_cash_fnc_remove) throw false;

    private _itemCount = 0;
    for "_i" from 0 to ((lbSize _uiListShoppingCartItems) - 1) do {
        private _data = (call compile (_uiListShoppingCartItems lbData _i));
        
        for "_j" from 0 to ((_uiListShoppingCartItems lbValue _i) - 1) do {
            [player, (_data select 0), -1, false, true] call lilc_inventory_fnc_add;
            _itemCount = _itemCount + 1;
        };
        //[[player, lilc_shops_currentShopname], "lils_shops_fnc_buyItem"] call lilc_common_fnc_sendToServer;
    };
    lbClear _uiListShoppingCartItems;

    [format["Item%1 erfolgreich gekauft!", (if (_itemCount > 1) then { "s"; } else { ""; })]] call lilc_ui_fnc_hint;
    throw true;
} catch {
    ctrlEnable [1211, true];
    _exception;
};
