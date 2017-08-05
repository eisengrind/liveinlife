
/*
    Filename:
        fn_giveMoney.sqf
    Author:
        Vincent Heins
    Description:
        Gives the money to target unit.
    Params:
        -
    Result:
        <bool> : whether the money were given to target or not
*/

try
{
    private _amount = ([(ctrlText 1552)] call lilc_common_fnc_textToNumber);
    if (_amount <= 0) then
    {
        //ctrlSetText [1552, ""];
        throw false;
    };

    if !([_amount] call lilc_cash_fnc_have) then
    {
        hint "Du besitzt nicht so viel Bargeld.";
        //ctrlSetText [1552, ""];
        throw false;
    };

    [player, _amount] call lilc_cash_fnc_remove;
    [[player, _amount], "lilc_actions_fnc_gaveMoney", lilc_actions_target] call lilc_common_fnc_send;
    closeDialog 1550;

    [(format [
        "Du hast %1 $%2 gegeben.",
        (
            if ([lilc_actions_target] call lilc_login_fnc_unitIsKnown) then
            {
                format [
                    "%1 %2",
                    ((lilc_actions_target getVariable ["lilc_identity", []]) select 1),
                    ((lilc_actions_target getVariable ["lilc_identity", []]) select 2)
                ];
            }
            else
            {
                """Unbekannt""";
            }),
        _amount
    ])] call lilc_ui_fnc_hint;
    
    throw true;
}
catch
{
    _exception;
};
