
lilc_bank_accounts = [];

[
    "lilce_login_postAccountInit",
    {
        [[player], "lils_bank_fnc_getAccounts"] call lilc_common_fnc_sendToServer;
    }
] call CBA_fnc_addEventHandler;
