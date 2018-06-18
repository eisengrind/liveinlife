
params [
    ["_alcohol", 0, [0]]
];

if (_alcohol <= 0) exitWith {};
lilc_drugs_alcohol_queue pushBack [_alcohol, ceil time];
