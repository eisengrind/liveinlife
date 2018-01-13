
private _bankAccount = _this;

if !([_bankAccount] call lilc_bank_fnc_addAccount) exitWith
{
    ["create_failed"] call lilc_atm_fnc_selectMenu;
};

["create_complete"] call lilc_atm_fnc_selectMenu;
lilc_atm_currentBankAccount = (_bankAccount select 4);
