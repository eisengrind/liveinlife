
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiListRankPermissions = (_ui displayCtrl 1408);
    private _index = lnbCurSelRow _uiListRankPermissions;
    if (_index <= -1) throw false;

    private _status = (_uiListRankPermissions lnbData [_index, 1]);
    _status = parseNumber _status;
    if (_status == 0) throw false;

    _uiListRankPermissions lnbSetText [[_index, 1], "Nein"];
    _uiListRankPermissions lnbSetData [[_index, 1], "0"];  
} catch {
    _exception;
};
