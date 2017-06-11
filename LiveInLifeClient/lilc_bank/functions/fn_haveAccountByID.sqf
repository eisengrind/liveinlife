
private _accountID = param [0, 0, [0]];

try {
    if (_accountID <= 0) throw false;

    {
        if ((_x select 4) == _accountID) throw true;
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
