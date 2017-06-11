
private _bankAccount = param [0, [], [[]]];

try {
    if !([_bankAccount] call lilc_bank_fnc_isAccountFormat) throw false;
    lilc_bank_accounts pushBack _bankAccount;
    lilc_bank_lastAddedBankID = (_bankAccount select 0);
} catch {
    _exception;
};
