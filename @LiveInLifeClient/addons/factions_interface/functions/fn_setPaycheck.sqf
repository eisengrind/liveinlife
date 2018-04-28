


[{
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

    lilc_paycheck_handle = [{
        (_this select 0) params [
            ["_bID", 0, [0]]
        ];

        private _rankID = player getVariable ["lilc_factionRankID", 0];
        if (_rankID <= 0) exitWith {};

        private _rank = [_rankID] call lilc_factions_interface_fnc_getRank;
        if ((count _rank) <= 0) exitWith {};

        if (_bID <= 0) then {
            [_rank select 3] call lilc_cash_fnc_add;
        } else {
            [[_bID, _rank select 3], "lils_bank_fnc_addValue"] call lilc_common_fnc_sendToServer;
        };

        if (lilc_paycheck_enableMessage) then {
            systemChat format["STR_lilc_factions_interface_Script_paycheckMessage" call BIS_fnc_localize, _rank select 3];
        };
    }, lilc_paycheck_timeout, [
        _bA select 0
    ]] call CBA_fnc_addPerFrameHandler;
}, [], lilc_paycheck_timeout] call CBA_fnc_waitAndExecute;
