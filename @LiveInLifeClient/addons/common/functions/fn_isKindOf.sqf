
/*
    Filename:
        fn_isKindOf.sqf
    Author:
        Vincent Heins
    Description:
        Very similiar to the BIS isKindOf command. But this function makes it possible to check for more than one kind at a time.
    Param(s):
        (_this select 0) : object to check for kind : <OBJECTNULL>
		(_this select 1) : kind/s to check for : <ARRAY> w/ <STRING>
    Result(s):
        true on inheritance; false != true : <BOOL>
*/

params [
    ["_object", objNull, [objNull, ""]],
    ["_kinds", [], ["", []]]
];

try {
    if (_object isEqualType objNull) then
    {
        if (isNull _object) throw false;
        if (isNull ([(typeOf _object)] call lilc_common_fnc_getClassnameConfig)) throw false;
    }
    else
    {
        if (isNull ([_object] call lilc_common_fnc_getClassnameConfig)) throw false;
    };

	if (_kinds isEqualType "") then {
		if (_kinds == "") throw false;
		_kinds = [_kinds];
	};
    if ((count _kinds) <= 0) throw false;

    { if (_object isKindOf _x) throw true; } forEach _kinds;
    throw false;
} catch {
    _exception;
};
