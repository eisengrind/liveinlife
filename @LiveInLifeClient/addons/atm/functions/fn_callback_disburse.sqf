
params [
    ["_status", false, [false]],
    ["_value", 0, [0]]
];

if (_status) then {
    [_value] call lilc_cash_fnc_add;
    ["disburse_completed"] call lilc_atm_fnc_selectMenu;
} else {
    ["disburse_failed"] call lilc_atm_fnc_selectMenu;
};
