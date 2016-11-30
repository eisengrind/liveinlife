
try {
    if (dialog) throw false;
    createDialog "lilc_keySettings";
    
    disableSerialization;
    _ui = (findDisplay 1330);
    if (isNull _ui) throw false;
    _uiListKeys = _ui displayCtrl 1331;

    _uiListKeys lnbAddColumn 0.5;

    call lilc_settings_fnc_updateKeyMenu;
} catch {
    _exception;
};
