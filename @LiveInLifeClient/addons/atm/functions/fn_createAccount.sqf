
/*
    Filename:
        fn_createAccount.sqf
    Author:
        Vincent Heins
    Description:
		Simply leads to the creation menu of the atm.
    Param(s):
        -
    Result(s):
        true = success; false != true : <BOOL>
*/

try {
    private _accountID = ([lilc_atm_currentBankName] call lilc_bank_fnc_createAccount);
    if (_accountID == 0) then {
        ["create_failed"] call lilc_atm_fnc_selectMenu;
        throw false;
    };

    lilc_atm_currentBankAccount = _accountID;
    ["create_complete"] call lilc_atm_fnc_selectMenu;
    throw true;
} catch {
    _exception;
};

/*
private _accountType = param [0, 0, [0]];

try {
    if !([lilc_atm_currentBankName, _accountType] call lilc_bank_fnc_createAccount) then {
        ["create_failed"] call lilc_atm_fnc_selectMenu;
        throw false;
    };

    ["create_complete"] call lilc_atm_fnc_selectMenu;
    throw true;
} catch {
    _exception;
};
*/
