
private _bankID = param [0, -1, [-1]];

try {
    if (isNull player) throw false;
    if !(isPlayer player) throw false;
    if ((count lilc_bank_accounts) <= 0) throw false;
    if (_bankID > -1) then { if (({ (_x select 0) == _bankID } count lilc_bank_accounts) <= 0) throw false; };

    throw true;
} catch {
    _exception;
};
