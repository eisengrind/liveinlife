
params [
    ["_date", [], [[]]],
    ["_weather", [], [[]]]
];
if ((count _date) != 5) exitWith {};
if ((count _weather) != 5) exitWith {};
setDate _date;
/*_weatherArr = [];
{ _weatherArr pushBack [1, _x]; } forEach _weather;
_weatherArr call LiveInLifeServer_weather_fnc_set;*/
