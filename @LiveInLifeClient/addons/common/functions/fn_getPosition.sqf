
/*
    Filename:
        fn_getPosition.sqf
    Author:
        Vincent Heins
    Description:
        Returns the position of any object in format: { positionASL, direction }
		It is the main command to get position of a player because it is an alias, which could be edited.
    Param(s):
        (_this select 0) : the object to gather position from : <OBJECTNULL>
    Result(s):
        the posDir : <ARRAY(2)>
*/

private _object = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _object) throw [[], 0];
    
    throw [(getPosASl _object), (getDir _object)];
} catch {
    _exception;
};
