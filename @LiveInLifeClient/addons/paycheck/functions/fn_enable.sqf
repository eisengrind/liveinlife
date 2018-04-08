
if (lilc_paycheck_bankName != "") exitWith {};

private _bA = ([lilc_paycheck_bankName] call lilc_bank_fnc_getAccountByBankName);

if ((count _bA) != 2) exitWith {
    [
        (format[
            "Du besitzt kein Bankkonto bei %1.", //TODO: localize
            getText(missionConfigFile >> "CfgBanks" >> lilc_paycheck_bankName >> "displayName")
        ]),
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

lilc_paycheck_waitTime = (time + lilc_paycheck_timeout);
lilc_paycheck_handle = ([
    {
        (_this select 0) params [
            ["_bID", 0, [0]]
        ];

        if (_bID <= 0) then {
            [lilc_paycheck_amount] call lilc_cash_fnc_add;
        } else {
            [[_bID, lilc_paycheck_amount], "lils_bank_fnc_addValue"] call lilc_common_fnc_sendToServer;
        };

        if (lilc_paycheck_enableMessage) then {
            systemChat format[("STR_lilc_paycheck_Script_messageFormat" call BIS_fnc_localize), lilc_paycheck_amount];
        };
    },
    lilc_paycheck_timeout, [
        (_bA select 0)
    ]
] call CBA_fnc_addPerFrameHandler);
