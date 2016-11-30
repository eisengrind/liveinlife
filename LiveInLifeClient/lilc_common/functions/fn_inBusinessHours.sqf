
params [
    ["_start", [], [[]]],
    ["_end", [], [[]]]
];
if ((count _start) <= 0) exitWith { false; };
if ((count _end) <= 0) exitWith { false; };

_startHour = _start select 0;
_startMinute = if ((count _start) < 2) then { 0; } else { _start select 1; };

_endHour = _end select 0;
_endMinute = if ((count _end) < 2) then { 0; } else { _end select 1; };

_currentDate = date;
_currentHour = (_currentDate select 3);
_currentMinute = (_currentDate select 4);

if ((dateToNumber [2000, 1, 1, _currentHour, _currentMinute]) >= (dateToNumber [2000, 1, 1, _startHour, _startMinute]) || (dateToNumber [2000, 1, 1, _currentHour, _currentMinute]) <= (dateToNumber [2000, 1, 1, _endHour, _endMinute])) exitWith { true; };
false;
