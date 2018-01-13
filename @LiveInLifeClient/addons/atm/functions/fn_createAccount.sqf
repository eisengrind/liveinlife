
/*
    Filename:
        fn_createAccount.sqf
    Author:
        Vincent Heins
    Description:
        Simply leads to the creation menu of the atm.
    Param(s):
        -
    Result(s):
        true = success; false != true : <BOOL>
*/

ctrlEnable [1522, false];
[
    [
        player,
        lilc_atm_currentBankName
    ],
    "lils_atm_fnc_createAccount"
] call lilc_common_fnc_sendToServer;
