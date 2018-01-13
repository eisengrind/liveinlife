
_palm = param [0, ObjNull, [ObjNull]];
if (isNull _palm) exitWith { hint "Bist wohl nech neben nem Baum, was?"; };
_palmInfo = getModelInfo _palm;
if !((_palmInfo select 0) in ["t_cocosnucifera3s_tall_f.p3d", "t_cocosnucifera2s_small_f.p3d"]) exitWith { hint "Such dir ne Palme, du depp!"; };

_maxHeight = ((_palm modelToWorld [0, 0, 0.4]) select 2);
_palmPosition = getPosATL _palm;
_time = time;

_myPalm = [];
{
    private ["_curPalm"];
    _curPalm = (_x select 0);
    if (_curPalm == _palm) exitWith { _myPalm = _x; };
} forEach lilc_action_gatheredPalms;

_timeout = -1;
if (((count _myPalm) <= 0)) then {
    _myPalm = [_palm, _time + (10 * 60)];
    lilc_action_gatheredPalms pushBack _myPalm;
    _timeout = _time;
} else {
    _timeout = (_myPalm select 1);
};
if (_timeout > time) exitWith { hint "Du hast hier schon gepflückt."; };

lilc_action_active = true;
lilc_action_finished = nil;
lilc_action_lastPosition = getPosASL player;
[[(_palmPosition select 0), (_palmPosition select 1), 0.5], _maxHeight] call lilc_farming_fnc_coconutsClimbUp;
waitUntil { !isNil "lilc_jobs_gatherCoconuts_finished" || !alive player };
if (!alive player) exitWith {};

if (lilc_action_finished) then {
    call lilc_farming_fnc_coconutsClimbHoldOn;
    lilc_action_finished = nil;
    waitUntil { !isNil "lilc_jobs_gatherCoconuts_finished" || !alive player };
    if (!alive player) exitWith {};
    
    _amount = (round (random [0, 5, 10]));
    if (_amount <= 0) then {
        hint "Hier gab es keine Kokusnüsse.";
    } else {
        for [{_i = 0}, {_i < _amount}, {_i = _i + 1}] do {
            player addItem "lilci_coconut_F";
        };
        hint format["Du hast %1 Kokusnüsse gepflückt.", _amount];
    };
    
    
    lilc_action_finished = nil;
    call lilc_farming_fnc_coconutsClimbDown;
    waitUntil { !isNil "jobs_gatherCoconuts_finished" || !alive player };
    if (!alive player) exitWith {};
} else {
    player switchMove "";
};

lilc_action_active = false;
