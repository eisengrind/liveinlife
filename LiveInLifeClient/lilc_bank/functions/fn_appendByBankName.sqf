
params [
    ["_bankName", "", [""]],
    ["_amount", 0, [0]]
];

try {
    private _config = ([_bankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _config) throw false;
    if (_amount <= 0) throw true;

    {
        if ((_x select 1) == _bankName) exitWith {
            (lilc_bank_accounts select _forEachIndex) set [2, ((_x select 2) + _amount)];
            throw true;
        };
    } forEach lilc_bank_accounts;

    throw false;
} catch {
    _exception;
};
