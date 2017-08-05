
private _unit = param [0, ObjNull, [ObjNull]];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    /*if (isNil "lilc_login_knownUnits") then
    {
        lilc_login_knownUnits = [];
    };

    if (_accountID in lilc_login_knownUnits) throw true;*/
    //lilc_login_knownUnits pushBack _accountID;

    private _knownUnits = (profileNamespace getVariable ["lilc_knownUnits", []]);
    if (_accountID in _knownUnits) throw true;

    _knownUnits pushBack _accountID;
    profileNamespace setVariable ["lilc_knownUnits", _knownUnits];
    saveProfileNamespace;

    throw true;
}
catch
{
    _exception;
};
