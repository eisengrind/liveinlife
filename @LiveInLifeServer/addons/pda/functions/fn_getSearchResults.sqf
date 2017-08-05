
params [
	["_unit", objNull, [objNull]],
	["_firstname", "", [""]],
	["_lastname", "", [""]]
];

//Idea: SELECT ID FROM ACCOUNT_DATA WHERE FIRSTNAME LIKE '%V%' AND `GROUP` = '-1'
try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (_firstname == "") throw false;

	private _result = [];
	_result = ([(format[
		"SELECT ID, FIRSTNAME, LASTNAME FROM ACCOUNT_DATA WHERE (FIRSTNAME LIKE '%1%2%1' OR FIRSTNAME LIKE '%1%3%1' OR LASTNAME LIKE '%1%2%1' OR LASTNAME LIKE '%1%3%1' OR FIRSTNAME LIKE '%1%2 %3%1' OR LASTNAME LIKE '%1%2 %3%1') AND `GROUP` = '-1'",
		"%",
		_firstname,
		(if (_lastname == "") then { _firstname; } else { _lastname; })
	])] call lils_database_fnc_fetchObjects);

	[
		["search", _result],
		"lilc_pda_fnc_setSelectMenu",
		_unit
	] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
