
private _transactionID = param [0, "", [""]];

try {
    { if (_transactionID == (_x select 0)) throw _x; } forEach lilc_bank_accounts;
    throw [];
} catch {
    _exception;
};
