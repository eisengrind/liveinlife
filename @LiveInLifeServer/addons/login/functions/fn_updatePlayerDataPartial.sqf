
params [
    ["_unit", objNull, [objNull]],
    ["_type", "", [""]],
    ["_data", nil]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    switch (_type) do
    {
        case "deathInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["RESPAWNING", ([(_data select 0)] call lilc_common_fnc_toBool)],
                    ["DEATHTIMEOUT", (_data select 1)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "statusInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["STATUS", (str (_data select 0))],
                    ["STATUSIMEOUT", (_data select 1)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "lastPosition":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["LASTPOSITION", ([_data] call lils_common_fnc_arrayEncode)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "gearInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["GEAR", ([_data] call lils_common_fnc_arrayEncode)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "cashInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["CASH", _data]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "nutritionInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["THIRST", (_data select 0)],
                    ["HUNGER", (_data select 1)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "newOff":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["NEW", 0]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "permissionInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["PERMISSIONS", ([_data] call lils_common_fnc_arrayEncode)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "virtualInventoryInfo":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["VIRTUALINVENTORY", ([_data] call lils_common_fnc_arrayEncode)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "prison_status":
        {
            [([
                "ACCOUNT_DATA",
                [
                    ["prison_currentPunishment", (_data select 0)],
                    ["prison_waitingTime", (_data select 1)],
                    ["prison_escapeTime", (_data select 2)]
                ],
                [
                    ["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])],
                    ["STEAM64ID", (getPlayerUID _unit)]
                ]
            ] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
        };

        case "lockers":
        {
            {
                [(format[
                    "INSERT INTO LOCKER_DATA (ID, ACCOUTNID, GEAR, LOCKER) SELECT * FROM (SELECT NULL, '%1', '""[[[],[]],[],[[],[]],[]]""', '%2') AS tmp WHERE NOT EXISTS (SELECT ID FROM LOCKER_DATA WHERE ACCOUNTID = '%1' AND LOCKER = '%2')",
                    (_unit getVariable ["lilc_accountID", 0]),
                    _x
                ])] call lils_database_fnc_query;
            } forEach _data;
        };

        default
        {
            throw false;
        };
    };

    throw true;
}
catch
{
    _exception;
};
