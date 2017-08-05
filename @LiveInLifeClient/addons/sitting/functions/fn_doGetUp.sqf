
try {
    if !([player] call lilc_sitting_fnc_canGetUp) throw false;

    private _object = lilc_sitting_currentSeat;
    if (isNull _object) throw false;
    
    if !([(typeOf _object), lilc_sitting_currentPositionName] call lilc_sitting_fnc_isPositionName) throw false;

    [player, lilc_sitting_lastPosition] call lilc_common_fnc_setPosition;
    [player, "AmovPercMstpSlowWpstDnon"] call lilc_common_fnc_switchMove;

    _object enableCollisionWith player;

    _object setVariable [(format["lilc_sitting_position_%1", lilc_sitting_currentPositionName]), objNull, true];
    lilc_sitting_lastPosition = [];
    lilc_sitting_currentPositionName = "";
    lilc_sitting_currentSeat = objNull;
    throw true;
} catch {
    _exception;
};