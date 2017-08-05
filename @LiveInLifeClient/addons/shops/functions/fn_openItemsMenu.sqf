
private _shopName = param [0, "", [""]];

try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (isNull player) throw false;
    if (!alive player) throw false;
    if (!isPlayer player) throw false;

    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    if (isNull _factionConfig && _shopname == "") throw false;
    
    private _shopInfo = [];
    if (_shopname == "" && _factionID > -1) then {
        private _factionConfig = ([_factionID] call lilc_common_fnc_getFactionConfig);
        _shopInfo = [(format["%1 Itemshop", (_factionConfig select 0)]), [_factionID]];
    } else {
        _shopInfo = ([_shopname] call lilc_shops_fnc_getShopConfig);
    };
    if !(_factionID in (_shopInfo select 1)) throw false;

    lilc_shops_currentShopname = _shopname;

    disableSerialization;
    if !(createDialog "lilcm_shops_buyItems") throw false;
    
    private _ui = (findDisplay 1205);
    private _uiTitle = (_ui displayCtrl 1206);
    private _uiTextSumOf = (_ui displayCtrl 1210);
    private _uiButtonRemove = (_ui displayCtrl 1213);
    
    _uiTitle ctrlSetText (_shopInfo select 0);
    _uiButtonRemove ctrlSetText "<<";
    _uiTextSumOf ctrlSetStructuredText parseText format["<t align='left' font='PuristaMedium'>Summe: 0$</t>"];

    call lilc_shops_fnc_updateBuyItemsMenu;
} catch {
    _exception;
};
