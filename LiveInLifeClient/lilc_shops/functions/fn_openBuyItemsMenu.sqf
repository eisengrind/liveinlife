
private _shopname = param [0, "", [""]];

try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (isNull player) throw false;
    if (!alive player) throw false;
    if (!isPlayer player) throw false;

    lilc_shops_currentShopname = _shopname;
    private _shopConfig = [];
    if (lilc_shops_currentShopname == "" && _factionID > -1) then {
        private _factionConfig = ([_factionID] call lilc_common_fnc_getFactionConfig);
        _shopConfig = [(_factionConfig select 0), [_factionID]];
    } else {
        _shopConfig = ([lilc_shops_currentShopname] call lilc_shops_fnc_getShopConfig);
    };
    if !(_factionID in (_shopConfig select 1) && (count (_shopConfig select 1)) != 0) throw false;

    createDialog "lilc_shops_buyItemsMenu";
    call lilc_shops_fnc_updateBuyItemsMenu;
} catch {
    _exception;
};
