
try
{
    if (isNull player) throw false;
    if !(isPlayer player) throw false;
    if (lilc_sitting_currentPositionName == "") throw false;

    private _object = lilc_sitting_currentSeat;
    if (isNull _object) throw false;
    if !([(typeOf _object), lilc_sitting_currentPositionName] call lilc_sitting_fnc_isPositionName) throw false;
    if ((_object getVariable [(format["lilc_sitting_position_%1", lilc_sitting_currentPositionName]), objNull]) isEqualTo player) throw true;
    
    throw false;
}
catch
{
    _exception;
};
