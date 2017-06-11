
/*
    Filename:
        fn_deposit.sqf
    Author:
        Vincent Heins
    Description:
		Deposits cash on a specific bankaccount.
    Param(s):
		(_this select 0) : amount to deposit : <SCALAR/INT>
    Result(s):
        true = success; false != true : <BOOL>
*/

private _amount = param [0, 0, [0]];

try {
    if !([lilc_atm_currentBankAccount] call lilc_bank_fnc_haveAccountByID) throw false;
    if !([_amount] call lilc_cash_fnc_have) throw false;
    
    if !([player, _amount] call lilc_cash_fnc_remove) throw false;
    if !([lilc_atm_currentBankAccount, _amount] call lilc_bank_fnc_appendByID) throw false;
    throw true;
} catch {
    if (_exception) then {
        ["deposit_completed"] call lilc_atm_fnc_selectMenu;
    } else {
        ["deposit_failed"] call lilc_atm_fnc_selectMenu;
    };
};
