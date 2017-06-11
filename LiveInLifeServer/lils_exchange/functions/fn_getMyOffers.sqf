
params [
    ["_unit", objNull, [objNull]],
    ["_exchangeName", "", [""]]
];

try
{
    //if ([_unit] call lilc_common_fnc_isAlive) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);

    /*
    0 - classname
    1 - amount
    2 - price
    3 - category
    4 - date
    5 - id
    */

    private _result = [];
    _result = ([
        (format["SELECT `classname`, `amount`, `price`, `category`, QUOTE(FROM_UNIXTIME(`timestampcreated`, '%3d.%3m.%3Y')), `id` FROM EXCHANGE_OFFERS WHERE ACCOUNTID = '%1' AND exchangeName = '%2'",
            _accountID,
            (str _exchangeName),
            "%"
        ])
    ] call lils_database_fnc_fetchObjects);

    [["myOffers", _result], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;

    throw true;
}
catch
{
    _exception;
};
