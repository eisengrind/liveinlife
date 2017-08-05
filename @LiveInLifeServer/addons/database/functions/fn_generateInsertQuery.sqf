
params [
    ["_table", "", [""]],
    ["_columnsAndValues", [], [[]]]
];

try
{
    if (_table == "") throw false;
    if ((count _columnsAndValues) <= 0) throw false;

    private _queryColumns = "";
    private _queryValues = "";

    {
        //[<column>, <value>]
        private _quote = (if ((count _x) == 3) then { (_x select 2); } else { true; });

        if (_forEachIndex == 0) then 
        {
            _queryColumns = format["`%1`", (_x select 0)];
            _queryValues = format["%1", (if (_quote) then { format["'%1'", (_x select 1)] } else { (_x select 1); })];
        }
        else
        {
            _queryColumns = format["%1, `%2`", _queryColumns, (_x select 0)];
            _queryValues = format["%1, %2", _queryValues, (if (_quote) then { format["'%1'", (_x select 1)] } else { (_x select 1); })];
        };
    } forEach _columnsAndValues;

    _queryColumns = format["(%1)", _queryColumns];
    _queryValues = format["(%1)", _queryValues];

    throw format["INSERT INTO %1 %2 VALUES %3;", _table, _queryColumns, _queryValues];
}
catch
{
    _exception;
};
