
private _accountID = param [0, 0, [0]];

try {
    if (_accountID <= 0) throw "";
    {
        if ((_x select 4) == _accountID) throw (_x select 1);
    } forEach lilc_bank_accounts;

    throw "";
} catch {
    _exception;
};
