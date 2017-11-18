
params [
    ["_data", nil]
];

(if ((_data call BIS_fnc_parseNumber) >= 1) then { true; } else { false; });
