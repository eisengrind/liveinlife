
private _lockers = param [0, [], [[]]];

try {
    if ((count _lockers) <= 0) throw false;

    disableSerialization;
    _ui = (findDisplay 1440);
    if (isNull _ui) throw false;

    private _uiComboLockers = (_ui displayCtrl 1441);

    //[id_1, id_2, ...]
    lbClear _uiComboLockers;
    {
        private _index = _uiComboLockers lbAdd format["Schließfach %1", (_x select 0)];
        _uiComboLockers lbSetData [_index, (str (_x select 0))];
    } forEach _lockers;
} catch {
    _exception;
};
