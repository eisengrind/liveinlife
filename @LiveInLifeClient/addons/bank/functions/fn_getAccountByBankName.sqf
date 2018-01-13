
private _bankName = param [0, "", [""]];

try {
    { if (_bankName == (_x select 1)) throw _x; } forEach lilc_bank_accounts;
    throw [];
} catch {
    _exception;
};
