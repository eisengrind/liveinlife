
private _accountID = param [0, 0, [0]];

try {
    { if (_accountID == (_x select 4)) throw _x; } forEach lilc_bank_accounts;
    throw [];
} catch {
    _exception;
};
