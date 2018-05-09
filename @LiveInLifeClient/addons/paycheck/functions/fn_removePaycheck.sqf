
params [
    ["_index", -1, [0]]
];

if (_index <= -1) exitWith {};
lilc_paycheck_paychecks = [lilc_paycheck_paychecks, _index] call CBA_fnc_hashRem;
