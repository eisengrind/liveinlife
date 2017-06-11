
private _currentItems = ([([
    "ECONOMY_DATA",
    [
        ["CLASSNAME"],
        ["COLOR"],
        ["DEALER"]
    ]
] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

private _definedItems = [];

{
    private _shopName = (configName _x);
    {
        _definedItems pushBack ([_shopName] + _x);
    } forEach getArray(_x >> "availableItems");
} forEach ("true" configClasses (missionConfigFile >> "CfgShops"));

{
    private _entry = _x;
    try {
        {
            if ((_entry select 0) == (_x select 1) && (_entry select 1) == (_x select 2) && (_entry select 2) == (_x select 0)) throw true;
        } forEach _definedItems;
        throw false;
    } catch {
        if !(_exception) then {
            [(format["DELETE FROM ECONOMY_DATA WHERE CLASSNAME = '""%1""' AND COLOR = '""%2""' AND DEALER = '""%3""'", (_entry select 0), (_entry select 1), (_entry select 2)])] call lils_database_fnc_query;
        };
    };
} forEach _currentItems;

//{"<shopName>", "<classname>", "<color(if)>", <maxprice>, <minprice>, <sellprice>, <buyprice>}
{
    private _item = _x;
    try {
        {
            if ((_item select 1) == (_x select 0) && (_item select 2) == (_x select 1) && (_item select 0) == (_x select 2)) throw true;
        } forEach _currentItems;
        throw false;
    } catch {
        if !(_exception) then {
            [([
                "ECONOMY_DATA",
                [
                    ["ID", "NULL", false],
                    ["CLASSNAME", (str (_item select 1))],
                    ["MAXPRICE", (_item select 3)],
                    ["MINPRICE", (_item select 4)],
                    ["TIMELASTSAVED", "UNIX_TIMESTAMP(NOW())", false],
                    ["DEALER", (str (_item select 0))],
                    ["SELLPRICE", (_item select 5)],
                    ["BUYPRICE", (_item select 6)],
                    ["SELLS", 0],
                    ["BUYS", 0],
                    ["COLOR", (str (_item select 2))]
                ]
            ] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;
        };
    };
} forEach _definedItems;
