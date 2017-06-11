
/*
    Filename:
        fn_getGroupMidPosition.sqf
    Author:
        Vincent Heins
    Description:
        Gets the center position of a arma group.
    Param(s):
        (_this select 0) : any arma group : <GROUPNULL>
    Result(s):
        positionAGL : <ARRAY(3)>
*/

private _group = param [0, grpNull, [grpNull]];

try {
    if (isNull _group) throw [0, 0, 0];

    _units = (units _group);
    if ((count _units) <= 0) throw [0, 0, 0];
    if ((count _units) == 1) throw (position leader _group);

    private _position = (position leader _group);
    {
        _position = [((((position _x) select 0) + (_position select 0)) * 0.5), ((((position _x) select 1) + (_position select 1)) * 0.5), ((((position _x) select 2) + (_position select 2)) * 0.5)];
    } forEach _units;

    _position = [((((position leader _group) select 0) + (_position select 0)) * 0.5), ((((position leader _group) select 1) + (_position select 1)) * 0.5), ((((position leader _group) select 2) + (_position select 2)) * 0.5)];

    throw _position;
} catch {
    _exception;
};
