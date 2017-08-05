
/*
    Filename:
        fn_setPosition.sqf
    Author:
        Vincent Heins
    Description:
        Sets the position of an object in position format posDir.
    Param(s):
        (_this select 0) : the object for the new position : <OBJECTNULL>
		(_this select 1) : the position in format posDir : <ARRAY(2)>
    Result(s):
        true = success; false != true : <BOOL>
*/

params [
    ["_object", ObjNull, [ObjNull]],
    ["_position", [], [[]]]
];

try {
    if (isNull _object) throw false;
    if ((count _position) != 2) throw false;
    if ((count (_position select 0)) != 3) throw false;
    if !((_position select 1) isEqualType 0) throw false;

    _object setPosASL (_position select 0);
    _object setDir (_position select 1);
	throw true;
} catch {
    _exception;
};
