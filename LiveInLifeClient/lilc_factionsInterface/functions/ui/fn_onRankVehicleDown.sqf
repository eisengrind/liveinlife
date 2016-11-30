
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiListRankVehicles = (_ui displayCtrl 1407);
    private _index = lnbCurSelRow _uiListRankVehicles;
    private _currentAmount = parseNumber (_uiListRankVehicles lnbData [_index, 2]);

    if (_currentAmount <= -1) throw false;

    _currentAmount = _currentAmount - 1;
    
    if (_currentAmount <= -1) then {
        _uiListRankVehicles lnbSetText [[_index, 2], "∞"];
    } else {
        _uiListRankVehicles lnbSetText [[_index, 2], (str _currentAmount)];
    };

    _uiListRankVehicles lnbSetData [[_index, 2], (str _currentAmount)];
} catch {
    _exception;
};
