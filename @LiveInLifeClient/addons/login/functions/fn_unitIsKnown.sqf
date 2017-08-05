
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    //if (_accountID in lilc_login_knownUnits) throw true;
    if (({ _x == _accountID } count (profileNamespace getVariable ["lilc_knownUnits", []])) == 1) throw true;
    throw false;
} catch {
    _exception;
};
