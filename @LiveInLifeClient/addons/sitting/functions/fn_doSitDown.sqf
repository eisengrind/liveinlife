
params [
    ["_object", objNull, [objNull]],
    ["_positionName", "", [""]]
];

try
{
    if !([_object, _positionName] call lilc_sitting_fnc_canSitDown) throw false;

    private _classname = (typeOf _object);

    private _seatConfig = ((call lilc_sitting_fnc_getSeatsConfig) >> _classname >> _positionName);
    if (isNull _seatConfig) throw false;

    private _animation = (selectRandom getArray(_seatConfig >> "animations"));
    if (_animation == "") throw false;

    private _position = getArray(_seatConfig >> "position");
    private _direction = getNumber(_seatConfig >> "direction");

    lilc_sitting_lastPosition = ([player] call lilc_common_fnc_getPosition);

    private _disableCollision = ([getNumber(_seatConfig >> "disableCollision")] call lilc_common_fnc_toBool);
    if (_disableCollision) then
    {
        player disableCollisionWith _object;
    };

    [player, _animation] call lilc_common_fnc_switchMove;
    
    if ((count _position) != 3) then
    {
        _position = [0, 0, 0];
    };

    systemChat str _position;
    private _positionAnim = (_object modelToWorld _position);
    [
        player,
        [
            (AGLToASL _positionAnim),
            ((getDir _object) + _direction)
        ]
    ] call lilc_common_fnc_setPosition;

    _object setVariable [(format["lilc_sitting_position_%1", _positionName]), player, true];
    lilc_sitting_currentPositionName = _positionName;
    lilc_sitting_currentSeat = _object;

    throw true;
}
catch
{
    _exception;
};
