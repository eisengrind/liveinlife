
/*
[
    [
        "SHOPNAME",
        [
            [
                "ITEMNAME",
                "COLOR"
                [
                    <SELLPRICE>,
                    <SELLS>#,
                    #[
                    #    <LASTSELLPRICE1>,
                    #    <LASTSELLPRICE2>,
                    #    <LASTSELLPRICE3>,
                    #    <LASTSELLPRICE4>
                    #]
                ],
                [
                    <BUYPRICE>,
                    <BUYS>#,
                    #[
                    #    <LASTBUYPRICE1>,
                    #    <LASTBUYPRICE2>,
                    #    <LASTBUYPRICE3>,
                    #    <LASTBUYPRICE4>
                    #]
                ],
                <COLOR>
            ]
        ]
    ],
    [...]
]
*/

lils_economy_data = [];
private _economyItems = ([("SELECT ID, CLASSNAME, MAXPRICE, MINPRICE, DEALER, SELLPRICE, BUYPRICE, SELLS, BUYS, COLOR FROM ECONOMY_DATA")] call lils_database_fnc_fetchObjects);

private _dealers = [];
{ if !((_x select 4) in _dealers) then { _dealers pushBack (_x select 4); }; } forEach _economyItems;

private _economyData = [];
{ _economyData pushBack [_x, []]; } forEach _dealers;

{
    private _item = _x;

    {
        private _dealer = _x;
        private _dealerIndex = _forEachIndex;
        if ((_dealer select 0) == (_item select 4)) exitWith {
            try {
                {
                    if ((_item select 1) == (_x select 0) && (_item select 9) == (_x select 1)) throw false;
                } forEach (_dealer select 1);

                throw true;
            } catch {
                if (_exception) then {
                    ((_economyData select _dealerIndex) select 1) pushBack [
                        (_item select 1),
                        (_item select 9),
                        [
                            (_item select 5),
                            (_item select 7)
                        ],
                        [
                            (_item select 6),
                            (_item select 8)
                        ]
                    ];
                };
            };
        };
    } forEach _economyData;
} forEach _economyItems;

lils_economy_data = _economyData;

publicVariable "lils_economy_data";
