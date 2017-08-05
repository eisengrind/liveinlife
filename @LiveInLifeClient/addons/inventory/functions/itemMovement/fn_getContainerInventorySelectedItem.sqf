
try {
    disableSerialization;
    private _ui = (findDisplay 602);
    if (isNull _ui) throw [];

    _uiList = (_ui displayCtrl 632);
    if ((lbCurSel _uiList) <= -1) throw [];
    
    private _classname = (_uiList lbData (lbCurSel _uiList));
    throw [_classname, ({ _x == _classname } count ((itemCargo lilc_inventory_currentContainer) + (weaponCargo lilc_inventory_currentContainer) + (magazineCargo lilc_inventory_currentContainer)))];
} catch {
    _exception;
};
