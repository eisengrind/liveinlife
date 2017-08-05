
params [
    ["_unit", objNull, [objNull]],
    ["_exchangeName", "", [""]],
    ["_categoryName", "", [""]],
    ["_classname", "", [""]]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _selections = 5;

    /*
        0 id, 1 type, 2 amount, 3 price, 4 accountid, 5 firstname, 6 lastname
    */
    private _result = [];
    _result = ([(format[
        "SELECT `EXCHANGE_OFFERS`.`id`, `EXCHANGE_OFFERS`.`type`, `EXCHANGE_OFFERS`.`amount`, `EXCHANGE_OFFERS`.`price`, `EXCHANGE_OFFERS`.`accountid`, `ACCOUNT_DATA`.`firstname`, `ACCOUNT_DATA`.`lastname` FROM `EXCHANGE_OFFERS`, `ACCOUNT_DATA` WHERE `EXCHANGE_OFFERS`.`category` = '%1' AND `EXCHANGE_OFFERS`.`classname` = '%2' AND `ACCOUNT_DATA`.`id` = `EXCHANGE_OFFERS`.`accountid` AND `EXCHANGE_OFFERS`.`type` = '0' AND `EXCHANGE_OFFERS`.`exchangeName` = '%3' ORDER BY `EXCHANGE_OFFERS`.`price` ASC LIMIT %4",
        (str _categoryName),
        (str _classname),
        (str _exchangeName),
        _selections
    ])] call lils_database_fnc_fetchObjects);

    _result = _result + ([(format[
        "SELECT `EXCHANGE_OFFERS`.`id`, `EXCHANGE_OFFERS`.`type`, `EXCHANGE_OFFERS`.`amount`, `EXCHANGE_OFFERS`.`price`, `EXCHANGE_OFFERS`.`accountid`, `ACCOUNT_DATA`.`firstname`, `ACCOUNT_DATA`.`lastname` FROM `EXCHANGE_OFFERS`, `ACCOUNT_DATA` WHERE `EXCHANGE_OFFERS`.`category` = '%1' AND `EXCHANGE_OFFERS`.`classname` = '%2' AND `ACCOUNT_DATA`.`id` = `EXCHANGE_OFFERS`.`accountid` AND `EXCHANGE_OFFERS`.`type` = '1' AND `EXCHANGE_OFFERS`.`exchangeName` = '%3' ORDER BY `EXCHANGE_OFFERS`.`price` DESC LIMIT %4",
        (str _categoryName),
        (str _classname),
        (str _exchangeName),
        _selections
    ])] call lils_database_fnc_fetchObjects);

    [["dashboard", _result], "lilc_exchange_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
    throw true;
}
catch
{
    _exception;
};
