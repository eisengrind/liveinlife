
lilc_bank_accounts = [];
[[player], "lils_bank_fnc_getAccounts"] call lilc_common_fnc_sendToServer;
waitUntil { (!isNil "lilc_bank_accounts") };
