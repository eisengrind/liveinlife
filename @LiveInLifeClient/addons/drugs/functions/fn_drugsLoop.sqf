
private _bac = (player getVariable ["lilc_drugs_bac", 0]) * 0.99995833333;

if ((random ((_bac max 3) - 3)) > 0.6/((speed player)/12 max 1) && !(player getVariable ["ace_isUnconscious", false])) then {
    [player, true, random [60, ((_bac max 3) - 3) * 60 * 2, ((_bac max 3) - 3) * 60 * 4]] call ace_medical_fnc_setUnconscious;
    _bac = _bac - 0.1;
};

if (_bac > 1) then {
    player setAnimSpeedCoef (0.4 max (1/_bac) min 1);
};

player setVariable ["lilc_drugs_bac", _bac, true];

[lilc_drugs_fnc_drugsLoop, [], 1] call CBA_fnc_waitAndExecute;
