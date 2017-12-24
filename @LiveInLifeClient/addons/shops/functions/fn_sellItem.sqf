
try {
    private _index = (lbCurSel 1251);
    if (_index <= -1) throw false;
    if (isNil "lilc_shops_currentShopname") throw false;
    if (lilc_shops_currentShopname == "") throw false;

    private _classname = (lbData [1251, _index]);
    private _price = (lbValue [1251, _index]);
    private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
    
    if (isNull _itemConfig) throw false;
    if !([player, _classname] call lilc_inventory_fnc_remove) then {
        [(format["Du hast nicht mehr genug %1!", getText(_itemConfig >> "displayName")])] call lilc_ui_fnc_hint;
        throw false;
    };
    if !([_price] call lilc_cash_fnc_add) throw false;

    [(format["Du hast %1 verkauft und %2 $ erhalten!", getText(_itemConfig >> "displayName"), _price])] call lilc_ui_fnc_hint;
    call lilc_shops_fnc_updateSellMenu;

    throw true;
} catch {
    _exception;
};
