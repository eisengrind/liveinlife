
[_this] params [
    ["_bankAccount", [], [[]]]
];

if ((count _bankAccount) > 0) then {
    lilc_bank_accounts pushBack [_bankAccount select 4, _bankAccount select 1];
    ["create_complete"] call lilc_atm_fnc_selectMenu;
} else {
    ["create_failed"] call lilc_atm_fnc_selectMenu;
};

lilc_atm_currentBankAccount = _bankAccount;
