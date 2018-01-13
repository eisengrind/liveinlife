
try {
    private _index = (lbCurSel 1540);
    if (_index < -1) throw false;

    private _value = lbValue [1540, _index];
    if (_value <= 0) throw false;

    private _bankAccount = ([_value] call lilc_bank_fnc_getAccountByID);
    if ((count _bankAccount) != 5) throw false;

    if ((_bankAccount select 3) == 0) then {
        ["account_locked"] call lilc_atm_fnc_selectMenu;
        throw false;
    };

    lilc_atm_currentBankAccount = (_bankAccount select 4);
    ["main"] call lilc_atm_fnc_selectMenu;
    throw true;
} catch {
    _exception;
};
