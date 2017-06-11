
disableSerialization;
params [
    ["_control", controlNull, [controlNull]],
    ["_index", 0, [0]]
];

try {
    if (isNull _control) throw false;
    if (_index <= -1) throw false;

    private _controlIDC = (ctrlIDC _control);

    private _column = -1;
    if (_controlIDC in [1396, 1384]) then { _column = 1; } else { _column = 2; };

    private _currentStatus = (parseNumber (_control lnbData [_index, _column]));
    _control lnbSetData [[_index, _column], (if (_currentStatus == 1) then { "0"; } else { "1"; })];
    _control lnbSetText [[_index, _column], ((if (_currentStatus == 1) then { "Nein"; } else { "Ja"; }))];
} catch {
    _exception;
};
