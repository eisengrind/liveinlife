
_number = param [0, 0, [0]];
if (_number < 0) exitWith { "00"; };
_count = count str _number;
if (_count > 1) exitWith { (str _number); };
([_number, 2] call lilc_common_fnc_formatNumber);
