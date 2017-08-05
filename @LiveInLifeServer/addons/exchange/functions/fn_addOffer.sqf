
params [
    ["_unit", objNull, [objNull]],
    ["_exchangeName", "", [""]],
    ["_type", -1, [0]],
    ["_category", "", [""]],
    ["_classname", "", [""]],
    ["_amount", 0, [0]],
    ["_price", 0, [0]]
];

try
{
    if !([_unit] call lilc_common_fnc_isAlive) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);

    private _exchangeConfig = ([_exchangeName] call lilc_exchange_fnc_getExchangeConfig);
    if (isNull _exchangeConfig) throw false;

    if !(_type in [0, 1]) throw false;
    if !(isClass (_exchangeConfig >> "categories" >> _category)) throw false;
    
    private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
    if (isNull _itemConfig) throw false;

    if (_amount <= 0) throw false;
    if (_price < 0) throw false;

    private _existingOffer = ([(format[
        "SELECT id FROM EXCHANGE_OFFERS WHERE accountID = '%1' AND `type` = '%2' AND price = '%3' AND exchangeName = '%4' AND category = '%5' AND classname = '%6'",
        _accountID,
        _type,
        _price,
        (str _exchangeName),
        (str _category),
        (str _classname)
    ])] call lils_database_fnc_fetchObjects);

    if ((count _existingOffer) <= 0) then
    {
        [([
            "EXCHANGE_OFFERS",
            [
                ["ID", "NULL", false],
                ["classname", (str _classname)],
                ["amount", _amount],
                ["price", _price],
                ["timestampcreated", "UNIX_TIMESTAMP(NOW())", false],
                ["accountID", _accountID],
                ["type", _type],
                ["category", (str _category)],
                ["exchangeName", (str _exchangeName)]
            ]
        ] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;
    }
    else
    {
        _existingOffer = (_existingOffer select 0);
        if ((count _existingOffer) == 1) then
        {
            private _existingOfferID = (_existingOffer select 0);
            [(format["UPDATE EXCHANGE_OFFERS SET amount = amount + '%1' WHERE id = '%2'", _amount, _existingOfferID])] call lils_database_fnc_query;
        };
    };

    [(format["INSERT INTO exchange_logs (classname, exchangeName, `type`, timestampadded, active, accountID) VALUES ('%1', '%2', '3', UNIX_TIMESTAMP(NOW()), 1, '%3')", (str _classname), (str _exchangeName), _accountID])] call lils_database_fnc_query;

    [["addOffer", [_classname]], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
}
catch
{
    [["addOffer", []], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
    _exception;
};





/**
params [
    ["_unit", objNull, [objNull]],
    ["_classname", "", [""]],
    ["_price", -1, [0]],
    ["_amount", 0, [0]],
    ["_type", 0, [0]]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    
    [([
        "EXCHANGE_OFFERS",
        [
            ["ID", "NULL", false],
            ["CLASSNAME", (str _classname), true],
            ["AMOUNT", _amount, true],
            ["PRICE", _price, true],
            ["TIMESTAMPCREATED", "UNIX_TIMESTAMP(NOW())", false],
            ["ACCOUNTID", (player getVariable ["lilc_accountID", 150]), true],
            ["TYPE", _type, true]
        ]
    ] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;
    throw true;
}
catch
{
    _exception;
};*/
