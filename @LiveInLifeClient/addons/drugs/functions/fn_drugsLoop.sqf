
private _bac = (player getVariable ["lilc_drugs_bac", 0]);
//insert amounts of alcohol to blood

for "_i" from 0 to (count lilc_drugs_alcohol_queue) - 1 do {
    private _def = (lilc_drugs_alcohol_queue select _i) select 0;
    private _time = (lilc_drugs_alcohol_queue select _i) select 1;
    if (((ceil time) - _time) > lilc_drugs_alcohol_maximumImpactTime) then {
        lilc_drugs_alcohol_queue deleteAt _i;
        _i = _i - 1;
    } else {
        private _deltaTimeCur = (ceil time) - _time;
        private _deltaTimeLast = ((ceil time) - 1 - _time) max 0;
        _bac = _bac + ([
            (-_def*exp(lilc_drugs_alcohol_impactFactor*(_deltaTimeLast-lilc_drugs_alcohol_maximumImpactTime))+_def) -
            (-_def*exp(lilc_drugs_alcohol_impactFactor*(_deltaTimeCur-lilc_drugs_alcohol_maximumImpactTime))+_def)
        ] call lilc_drugs_fnc_getBAC);
    };
};

//remove amount of bac per second
_bac = _bac * 0.99995833333;

//make alcohol effects
if ((random ((_bac max 3) - 3)) > 0.6/((speed player)/12 max 1) && !(player getVariable ["ace_isUnconscious", false])) then {
    [player, true, random [60, ((_bac max 3) - 3) * 60 * 2, ((_bac max 3) - 3) * 60 * 4]] call ace_medical_fnc_setUnconscious;
    _bac = _bac - 0.1;
};

if (_bac > 1) then {
    player setAnimSpeedCoef (0.4 max (1/_bac) min 1);
};

player setVariable ["lilc_drugs_bac", _bac, true];

[lilc_drugs_fnc_drugsLoop, [], 1] call CBA_fnc_waitAndExecute;
