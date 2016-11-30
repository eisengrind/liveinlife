
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    private _uiListPlayerPermissions = (_ui displayCtrl 1397);
    private _index = lnbCurSelRow _uiListPlayerPermissions;
    if (_index <= -1) throw false;

    private _status = (_uiListPlayerPermissions lnbData [_index, 1]);
    _status = parseNumber _status;
    if (_status == 0) throw false;

    _uiListPlayerPermissions lnbSetText [[_index, 1], "Nein"];
    _uiListPlayerPermissions lnbSetData [[_index, 1], "0"];  
} catch {
    _exception;
};
