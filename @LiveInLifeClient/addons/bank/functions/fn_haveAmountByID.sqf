
params [
    ["_accountID", 0, []],
    ["_amount", 0, [0]]
];

try {
    {
        if ((_x select 4) == _accountID) exitWith {
            if (((_x select 2) - _amount) >= 0) throw true;
        };
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
