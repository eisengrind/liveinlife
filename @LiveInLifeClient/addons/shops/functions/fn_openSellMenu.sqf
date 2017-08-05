
private _shopName = param [0, "", [""]];

try {
    if (dialog) throw false;
    if !(createDialog "lilcm_sell") throw false;
    lilc_shops_currentShopname = _shopName;

    if !(call lilc_shops_fnc_updateSellMenu) then {
        closeDialog 0;
        throw false;
    };

    throw true;
} catch {
    _exception;
};

// this addAction ["", { [(_this select 3)] call lilc_shops_fnc_openSellMenu; }, "<shopName>"];
