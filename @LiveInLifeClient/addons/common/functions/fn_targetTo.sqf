
/*
    Filename:
        fn_targetTo.sqf
    Author:
        Vincent Heins
    Description:
        This function will set the players direction to the attached position (or object).
    Param(s):
        (_this select 0) : the unit to 'turn' : <OBJECTNULL>
		(_this select 1) : the position or object w/ position to turn to : <OBJECTNULL>, <ARRAY(3)>
    Result(s):
        true = success; false != true : <BOOL>
*/

params [
    ["_unit", ObjNull, [ObjNull]],
    ["_position", [], [ObjNull, []]]
];

try {
    if (isNull _unit) throw false;
    if (_position isEqualType ObjNull) then { if (isNull _position) throw false; };
    if (_position isEqualType []) then { if ((count _position) != 3) throw false; };

    
    _direction = _unit getDir _position;
    _unit setDir _direction;
	throw true;
} catch {
    _exception;
};
