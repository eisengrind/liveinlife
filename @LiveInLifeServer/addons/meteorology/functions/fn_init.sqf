
scriptName "lils_meteorology_meteorologyLoop";
(call lils_meteorology_fnc_get) call lils_meteorology_fnc_set;

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

    sleep 60;
};
