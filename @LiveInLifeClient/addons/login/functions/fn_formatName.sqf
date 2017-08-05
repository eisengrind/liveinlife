
/*
AVAILABLE VARIABLES:
	-	<ADDRESS> : Salutation / form of address
	-	<FIRSTNAME> : Firstname
	-	<LASTNAME> : Lastname
*/

params [
	["_unit", objNull, [objNull]],
	["_nameFormat", "<FIRSTNAME> <LASTNAME>", [""]]
];

try
{
	if (isNull _unit) throw "";
	if !(isPlayer _unit) throw "";

	private _identity = (_unit getVariable ["lilc_identity", []]);
	if ((count _identity) != 3) throw "";

	private _gender = (_identity select 0);
	private _firstname = (_identity param [1, "Unbekannt", [""]]);
	private _lastname = (_identity param [2, "Unbekannt", [""]]);

	_nameFormat = ([
		_nameFormat,
		"<ADDRESS>",
		(if (_gender == 1) then
		{
			"Frau";
		}
		else
		{
			"Herr";
		})
	] call KRON_Replace);
	_nameFormat = ([_nameFormat, "<FIRSTNAME>", _firstname] call KRON_Replace);
	_nameFormat = ([_nameFormat, "<LASTNAME>", _lastname] call KRON_Replace);

	throw _nameFormat;
}
catch
{
	_exception;
};
