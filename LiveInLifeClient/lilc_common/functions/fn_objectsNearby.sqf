
/*
    Filename:
        fn_objectsNearby.sqf
    Author:
        Vincent Heins
    Description:
        Checks whether an object is nearby a given radius and position or not.
    Param(s):
        (_this select 0) : center position of the area circle : <OBJECTNULL>, <ARRAY(3)>
		(_this select 1) : radius of the circle : <SCALAR/INT/FLOAT>
		(_this select 2) : kind-of types to check for : <ARRAY> w/ <STRING>, <STRING>
    Result(s):
        -
*/

params [
    ["_position", ObjNull, [[], ObjNull]],
    ["_radius", 10, [-1]],
    ["_types", ["Man", "Car", "House", "Building", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"], ["", []]]
];

_result = false;
try {
    if ((typeName _position) isEqualTo (typeName ObjNull)) then { if (isNull _position) then { throw false; };};
    if ((typeName _position) isEqualTo (typeName [])) then { if ((count _position) <= 2) then { throw false; };};
    if (_radius < 0) throw false;
    if ((typeName _types) isEqualTo (typeName "") && _types isEqualTo "") throw false;
    if (typeName _position isEqualTo (typeName [])) then { _position = ASLToAGL _position; };
    if ((typeName _types) isEqualTo (typeName "")) then { _types = [_types]; };

    _nearbyObjects = nearestObjects [_position, _types, _radius];
    _nearbyObjects = _nearbyObjects - [player];
    
    if ((count _nearbyObjects) <= 0) throw false;
    throw true;
} catch {
    _exception;
};
