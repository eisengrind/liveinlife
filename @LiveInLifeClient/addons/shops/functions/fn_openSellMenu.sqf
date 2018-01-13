
private _shopName = param [0, "", [""]];

try {
    if (dialog) throw false;
    if !(createDialog "lilcm_sell") throw false;
    lilc_shops_currentShopname = _shopName;

    call lilc_shops_fnc_updateSellMenu;

    throw true;
} catch {
    _exception;
};

// this addAction ["", { [(_this select 3)] call lilc_shops_fnc_openSellMenu; }, "<shopName>"];
