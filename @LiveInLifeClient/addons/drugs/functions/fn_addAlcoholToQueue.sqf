
params [
    ["_alcohol", 0, [0]]
];

if (_alcohol <= 0) exitWith {};

(lilc_drugs_alcohol_queue select 0) pushBack _alcohol;
(lilc_drugs_alcohol_queue select 1) pushBack ceil time;
