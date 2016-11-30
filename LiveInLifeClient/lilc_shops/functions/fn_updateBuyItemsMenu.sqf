
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    disableSerialization;    
    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    private _uiListItems = (_ui displayCtrl 1206);
    private _uiComboCategories = (_ui displayCtrl 1207);
    private _uiTextBalance = (_ui displayCtrl 1208);
    private _uiButtonBuy = (_ui displayCtrl 1209);

    lbClear _uiListItems;
    lbClear _uiComboCategories;

    _uiTextBalance ctrlSetStructuredText parseText "<t align='left' font='PuristaLight'>Summe: <t color='#6EE6A2'>0 $</t></t>";
    _uiButtonBuy ctrlEnable false;

    [[player, lilc_shops_currentShopname, _factionID], "lils_shops_fnc_getBuyItems"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
