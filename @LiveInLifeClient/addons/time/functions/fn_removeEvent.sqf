
params [
	["_id", 0, [0]]
];

lilc_time_events = ([lilc_time_events, _id] call CBA_fnc_hashRem);
