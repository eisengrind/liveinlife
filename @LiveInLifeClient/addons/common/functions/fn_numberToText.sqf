/*
    Date:
        17.10.2016
	Author:
        Karel Moricky
    Modified:
        Vincent Heins
	Description:
	    Convert a number into string (avoiding scientific notation)
	Params:
	    (_this select 0) : The number to convert : <SCALAR/INT>
        (_this select 1) : The distance between the next split
        (_this select 2) : The char to insert as split
	Returns:
	     the a number as string (with split chars); otherwise returns "" - <STRING>
*/

params [
	["_number", 0, [0]],
	["_mod", 3, [0]],
	["_char", ".", [""]]
];

private _digits = _number call bis_fnc_numberDigits;
private _digitsCount = count _digits - 1;

private _modBase = _digitsCount % _mod;
private _numberText = "";
{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {
		_numberText = _numberText + _char;
	};
} foreach _digits;

_numberText;
