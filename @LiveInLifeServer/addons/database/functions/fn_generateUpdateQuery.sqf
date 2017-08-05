
params [
    ["_table", "", [""]],
    ["_setColumns", [], [[]]], // [{"column", value, brackets?}]
	["_neededColumns", [], [[]]] // [{"column", value, brackets?}]
];// UPDATE XYZ SET xyz=2, xyz=6 WHERE xyz=4...

try
{
	if (_table == "") throw false;
	
	private _querySetColumns = "";
	private _queryNeededColumns = "";

	{
		private _quote = (if ((count _x) == 3) then { (_x select 2); } else { true; });

		if (_forEachIndex <= 0) then
		{
			_querySetColumns = format["`%1` = %2", (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
		}
		else
		{
			_querySetColumns = format["%1, `%2` = %3", _querySetColumns, (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
		};
	} forEach _setColumns;

	{
		private _quote = (if ((count _x) == 3) then { (_x select 2); } else { true; });

		if (_forEachIndex <= 0) then
		{
			_queryNeededColumns = format["`%1` = %2", (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
		}
		else
		{
			_queryNeededColumns = format["%1 AND `%2` = %3", _queryNeededColumns, (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
		};
	} forEach _neededColumns;

	if (_querySetColumns == "") throw "";
	throw format["UPDATE `%1` SET %2%3;", _table, _querySetColumns, (if (_queryNeededColumns != "") then { format[" WHERE %1", _queryNeededColumns]; } else { ""; })];
}
catch
{
    _exception;
};
