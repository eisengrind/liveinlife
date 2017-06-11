
params [
    ["_table", "", [""]],
    ["_requestedColumns", [], [[]]],
    ["_neededColumns", [], [[]]],
    ["_additionalSQL", "", [""]]
];

try {
    if (_table == "") throw "";
    if ((count _requestedColumns) <= 0) throw "";

    private _queryRequestedColumns = "";
    {
        private _quote = (if ((count _x) == 2) then { (_x select 1); } else { true; });

        if (_forEachIndex == 0) then {
            _queryRequestedColumns = format["%1", (if (_quote) then { format["`%1`", (_x select 0)]; } else { (_x select 0); })];
        } else {
            _queryRequestedColumns = format["%1, %2", _queryRequestedColumns, (if (_quote) then { format["`%1`", (_x select 0)]; } else { (_x select 0); })];
        };
    } forEach _requestedColumns;
    
    private _queryNeededColumns = "";
    {
        private _quote = (if ((count _x) == 3) then { (_x select 2); } else { true; });
        //column, value
        if (_forEachIndex == 0) then {
            _queryNeededColumns = format["`%1` = %2", (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
        } else {
            _queryNeededColumns = format["%1 AND `%2` = %3", _queryNeededColumns, (_x select 0), (if (_quote) then { format["'%1'", (_x select 1)]; } else { (_x select 1); })];
        };
    } forEach _neededColumns;

    throw format["SELECT %1 FROM %2%3%4;", _queryRequestedColumns, _table, (if (_queryNeededColumns != "") then { format[" WHERE %1", _queryNeededColumns]; } else { ""; }), format[" %1", _additionalSQL]];
} catch {
    _exception;
};
