
params [
    ["_alcohol", 0, [0]],
    ["_time", 0, [0]],
    ["_delay", lilc_drugs_sedatives_defaultDelay, [0]]
];

if (_alcohol <= 0 || _time <= 0) exitWith {};
lilc_drugs_sedatives_cache pushBack [CBA_missionTime + _delay, _time, _alcohol]; //[delay, effectTime, alcohol]
lilc_drugs_sedatives_cacheSorted = false;
