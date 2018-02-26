
params [
    ["_value", 0, [0]]
];

if (_value <= 0) exitWith {
    ["deposit_failed"] call lilc_atm_fnc_selectMenu;
};

if !([_value] call lilc_cash_fnc_remove) exitWith {
    ["Du besitzt nicht genügend Geld", "ERROR"] call lilc_ui_fnc_hint;
};

["deposit_wait"] call lilc_atm_fnc_selectMenu;
[[player, lilc_atm_currentBankAccount select 4, _value], "lils_atm_fnc_deposit"] call lilc_common_fnc_sendToServer;
