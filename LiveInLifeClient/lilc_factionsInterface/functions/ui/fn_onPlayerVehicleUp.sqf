
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    private _uiListPlayerVehicles = (_ui displayCtrl 1389);
    private _index = lnbCurSelRow _uiListPlayerVehicles;
    private _currentAmount = parseNumber (_uiListPlayerVehicles lnbData [_index, 2]);

    _currentAmount = _currentAmount + 1;
    _uiListPlayerVehicles lnbSetData [[_index, 2], (str _currentAmount)];
    _uiListPlayerVehicles lnbSetText [[_index, 2], (str _currentAmount)];
} catch {
    _exception;
};
