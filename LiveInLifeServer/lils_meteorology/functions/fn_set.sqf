
params [
    ["_mapTime", [], [[]]],
    ["_mapWeather", [], [[]]]
];

try {
    //_weather = [fog, overcast, rain, rainbow, waves, gusts, wind];
    //_date = [2014,10,30,2,30];
    if ((count _mapTime) != 5) throw false;
    if ((count _mapWeather) != 7) throw false;

    setDate _mapTime;
    1 setFog (_mapWeather select 0);
    1 setOvercast (_mapWeather select 1);
    1 setRain (_mapWeather select 2);
    1 setRainbow (_mapWeather select 3);
    1 setWaves (_mapWeather select 4);
    1 setGusts (_mapWeather select 5);
    setWind [((_mapWeather select 6) select 0), ((_mapWeather select 6) select 1), false];
    forceWeatherChange;
    throw true;
} catch {
    _exception;
};
