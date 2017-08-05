
/*
    Filename:
        fn_disburse.sqf
    Author:
        Vincent Heins
    Description:
        Disburse money from bankaccount to cash.
    Param(s):
        (_this select 0) : amount to disburse : <SCALAR/INT>
    Result(s):
        true = successful; false != true : <BOOL>
*/

//abheben
private _amount = param [0, 0, [0]];

try {
    if !([lilc_atm_currentBankAccount] call lilc_bank_fnc_haveAccountByID) throw false;
    if !([lilc_atm_currentBankAccount, _amount] call lilc_bank_fnc_haveAmountByID) throw false;

    if !([lilc_atm_currentBankAccount, _amount] call lilc_bank_fnc_removeAmountByID) throw false;
    if !([player, _amount] call lilc_cash_fnc_add) throw false;
    throw true;
} catch {
    if (_exception) then {
        ["disburse_completed"] call lilc_atm_fnc_selectMenu;
    } else {
        ["disburse_failed"] call lilc_atm_fnc_selectMenu;
    };
};
