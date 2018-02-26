
params [
    ["_value", 0, [0]]
];

if (_value <= 0) exitWith {
    ["disburse_failed"] call lilc_atm_fnc_selectMenu;
};

["disburse_wait"] call lilc_atm_fnc_selectMenu;
[[player, lilc_atm_currentBankAccount select 4, _value], "lils_atm_fnc_disburse"] call lilc_common_fnc_sendToServer;
