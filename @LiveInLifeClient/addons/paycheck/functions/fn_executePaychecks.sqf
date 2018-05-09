
[lilc_paycheck_fnc_executePaychecks, nil, lilc_paycheck_timeout] call CBA_fnc_waitAndExecute;

private _keys = [lilc_paycheck_paychecks] call CBA_fnc_hashKeys;
if ((count _keys) <= 0) exitWith {};

private _message = "";
private _sumAmount = 0;

for "_i" from 0 to (count _keys) - 1 do {
    private _val = [lilc_paycheck_paychecks, _keys select _i] call CBA_fnc_hashGet;
    if ((count _val) == 3) then {
        private _amount = call (_val select 1);
        private _bankAccountCfg = [_val select 2] call lilc_bank_fnc_getBankConfig;
        private _bankAccount = [_val select 2] call lilc_bank_fnc_getAccountByBankName;
        private _hasBankAccount = (count _bankAccount) == 5;

        if (_amount > 0) then {
            if ((_val select 2) == "") then {
                [_amount] call lilc_cash_fnc_add;
            } else {
                if (_hasBankAccount) then {
                    [[_bID, lilc_paycheck_amount], "lils_bank_fnc_addValue"] call lilc_common_fnc_sendToServer;
                };
            };

            if (_hasBankAccount || (_val select 2) == "") then {
                _sumAmount = _sumAmount + _amount;
                _message = format[
                    "%1 - %2 ($%3) %4<br />",
                    _message,
                    _val select 0,
                    _amount,
                    (if (_hasBankAccount) then {
                        format["(%1)", getText(_bankAccountCfg >> "displayName")];
                    } else {
                        "";
                    })
                ];
            };
        };
    };
};

if (_sumAmount <= 0) exitWith {};

_message = format[
    format["<t size='0.8'>%1</t>", "STR_lilc_paycheck_Script_messageFormat" call BIS_fnc_localize],
    _message,
    _sumAmount
];
[_message] call lilc_ui_fnc_hint;
