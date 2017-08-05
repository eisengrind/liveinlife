
/*
IMPORTANT INFORMATION ABOUT ECONOMY_DATA:
    classname column only accepts maximum 64 chars (64 - 2 because of the char of each bracket)
    shopname column also only accepts maximum 64
    color column accepts (256 - 2) char lengths
*/

/*

*/

scriptName "lils_economy_processIteration";

private _s = ("true" configClasses (missionConfigFile >> "CfgShops"));
{
    private _cfg = _x;
    {
        [(format[
            "INSERT IGNORE INTO economy_data (ID, classname, maxp, minp, timelastsaved, shopname, sellprice, buyprice, sells, buys, color) VALUES (NULL, '%1', '%2', '%3', UNIX_TIMESTAMP(NOW()), '%4', '%5', '%6', '0', '0', '%7')",
            (str (_x select 0)),
            (_x select 2),
            (_x select 3),
            (str (configName _cfg)),
            (_x select 4),
            (_x select 5),
            (str (_x select 1))
        ])] call lils_database_fnc_query;
    } forEach getArray(_cfg >> "availableItems");
} forEach _s;

_s = (_s apply { (configName _x); });

private _eData = [];
{
    private _sName = _x;
    private _sData = [];
    private _dbData = ([([
        "economy_data",
        [
            ["classname"],
            ["color"],
            ["sellprice"],
            ["buyprice"]
        ],
        [
            ["shopname", (str _sName)]
        ]
    ] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

    private _pN = (format["lils_economy_tmp_%1", _sName]);
    missionNamespace setVariable [_pN, _dbData];
    publicVariable _pN;
} forEach _s;
