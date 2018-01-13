
params [
    ["_accountID", 0, [0]],
    ["_amount", 0, [0]]
];

try {
    if !([_accountID] call lilc_bank_fnc_haveAmountByID) throw false;

    {
        if ((_x select 4) == _accountID && ((_x select 2) - _amount) >= 0) exitWith {
            (lilc_bank_accounts select _forEachIndex) set [2, ((_x select 2) - _amount)];
            throw true;
        };
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
