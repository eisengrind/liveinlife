
private _accountID = param [0, 0, [0]];
diag_log format["Login: AccountID: %1", _accountID];
if (_accountID <= 0) exitWith {};

lilc_login_loginSuccessful = nil;
diag_log "Package send.";
[[player, _accountID], "lils_login_fnc_executeSetPackages"] call lilc_common_fnc_sendToServer;
