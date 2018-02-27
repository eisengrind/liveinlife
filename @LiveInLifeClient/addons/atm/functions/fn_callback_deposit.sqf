
params [
    ["_status", false, [false]],
    ["_value", 0, [0]]
];

if (_status) then {
    lilc_atm_currentBankAccount set [2, (lilc_atm_currentBankAccount select 2) + _value];
    ["disburse_completed"] call lilc_atm_fnc_selectMenu;
} else {
    [_value] call lilc_cash_fnc_add;
    ["disburse_failed"] call lilc_atm_fnc_selectMenu;
};
