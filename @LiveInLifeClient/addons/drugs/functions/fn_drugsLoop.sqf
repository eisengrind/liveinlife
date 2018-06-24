
private _bac = (player getVariable ["lilc_drugs_bac", 0]);
//insert amounts of alcohol to blood

if (!lilc_drugs_sedatives_cacheSorted) then {
    lilc_drugs_sedatives_cache sort true;
    lilc_drugs_sedatives_cacheSorted = true;
};

private _delete = false;
private ["_t"];
{
    _t = CBA_missionTime - (_x select 0);
    if (_x select 1 < _t) then {
        lilc_drugs_sedatives_cache set [_forEachIndex, objNull];
        _delete = true;
    };
    if (_t > 0) exitWith {};
    _bac = _bac + ([(_x select 1) / (_x select 2)] call lilc_drugs_fnc_getBAC);
} forEach lilc_drugs_sedatives_cache;
if (_delete) then {
    lilc_drugs_sedatives_cache = lilc_drugs_sedatives_cache - [objNull];
};

//remove amount of bac per second
_bac = _bac * 0.99995833333;

//make alcohol effects
if ((random ((_bac max 3) - 3)) > 0.6/((speed player)/12 max 1) && !(player getVariable ["ace_isUnconscious", false])) then {
    [player, true, random [60, ((_bac max 3) - 3) * 60 * 2, ((_bac max 3) - 3) * 60 * 4]] call ace_medical_fnc_setUnconscious;
    _bac = _bac - 0.1;
};

player setVariable ["lilc_drugs_bac", _bac, true];

[lilc_drugs_fnc_drugsLoop, [], 1] call CBA_fnc_waitAndExecute;
