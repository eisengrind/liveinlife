
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiListRankEquipment = (_ui displayCtrl 1406);
    private _index = lnbCurSelRow _uiListRankEquipment;
    private _currentAmount = parseNumber (_uiListRankEquipment lnbData [_index, 2]);

    if (_currentAmount <= -1) throw false;

    _currentAmount = _currentAmount - 1;
    
    if (_currentAmount <= -1) then {
        _uiListRankEquipment lnbSetText [[_index, 2], "∞"];
    } else {
        _uiListRankEquipment lnbSetText [[_index, 2], (str _currentAmount)];
    };

    _uiListRankEquipment lnbSetData [[_index, 2], (str _currentAmount)];
} catch {
    _exception;
};

