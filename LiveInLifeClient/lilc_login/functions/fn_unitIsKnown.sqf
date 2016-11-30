
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    _unitID = _unit getVariable ["lilc_accountID", 0];
    if (_unitID <= 0) throw false;

    _currentKnows = profileNamespace getVariable ["lilc_knownUnits", []];
    if (_unitID in _currentKnows) throw true;

    throw false;
} catch {
    _exception;
};
