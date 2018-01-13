
params [
    ["_accountID", 0, [0]],
    ["_amount", 0, [0]]
];

try {
    if (_amount <= 0) throw true;

    {
        if ((_x select 4) == _accountID) exitWith {
            (lilc_bank_accounts select _forEachIndex) set [2, ((_x select 2) + _amount)];
            throw true;
        };
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
