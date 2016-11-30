
try {
    disableSerialization;    
    private _ui = (findDisplay 1201);
    if (isNull _ui) throw false;

    private _uiListItems = (_ui displayCtrl 1202);
    private _uiComboCategories = (_ui displayCtrl 1203);
    private _uiTextBalance = (_ui displayCtrl 1204);
    private _uiButtonBuy = (_ui displayCtrl 1205);

    private _category = (_uiComboCategories lbData (lbCurSel _uiComboCategories));
    if (_category != "") then { [_category, 40] call lilc_shops_fnc_setBuyUniformsCamera; };

    lbClear _uiListItems;
    lbClear _uiComboCategories;

    _uiTextBalance ctrlSetStructuredText parseText "<t align='left' font='PuristaLight'>Summe: <t color='#6EE6A2'>0 $</t></t>";
    _uiButtonBuy ctrlEnable false;

    [[player, lilc_shops_currentShopname], "lils_shops_fnc_getBuyUniforms"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
