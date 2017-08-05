
scriptName "lils_meteorology_meteorologyLoop";
(call lils_meteorology_fnc_get) call lils_meteorology_fnc_set;
/*
private _nightStart = getArray(missionConfigFile >> "CfgMaster" >> "nightStart");
private _dayStart = getArray(missionConfigFile >> "CfgMaster" >> "dayStart");

private _dayAmount = 1;
private _nightAmount = 1;

private _nightTime = (getNumber(missionConfigFile >> "CfgMaster" >> "nightTime"));
private _dayTime = (getNumber(missionConfigFile >> "CfgMaster" >> "dayTime"));

if ((count _nightStart) == 2 && (count _dayStart) == 2) then {
    _dayAmount = ([_dayStart, _nightStart] call lilc_common_fnc_gameTimeDiff) / _dayTime;
    _nightAmount = ([_nightStart, _dayStart] call lilc_common_fnc_gameTimeDiff) / _nightTime;
};*/

private _dayArray = getArray(missionConfigFile >> "CfgMaster" >> "day");

while {true} do {
    private _date = date;
    private _weather = [fog, overcast, rain, rainbow, waves, gusts, [(wind select 0), (wind select 1)]];

    if ((count _dayArray) == 5) then {
        if ((_date select 0) != (_dayArray select 0) || (_date select 1) != (_dayArray select 1) || (_date select 2) != (_dayArray select 2)) then {
            _date set [0, (_dayArray select 0)];
            _date set [1, (_dayArray select 1)];
            _date set [2, (_dayArray select 2)];

            setDate _date;
        };
    };

    /*if ([_dayStart, _nightStart, [(_date select 3), (_date select 4)]] call lilc_common_fnc_inGameTime) then {
        setTimeMultiplier _dayAmount;
    } else {
        setTimeMultiplier _nightAmount;
    };*/

    sleep 60;
};
