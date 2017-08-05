
private _bankName = param [0, "", [""]];

try {
    private _config = ([_bankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _config) throw false;

    {
        if ((_x select 1) == _bankName) throw true;
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
