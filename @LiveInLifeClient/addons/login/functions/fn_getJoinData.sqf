
private _accountID = param [0, 0, [0]];
if (_accountID <= 0) exitWith {};

lilc_login_loginSuccessful = nil;
[[player, _accountID], "lils_login_fnc_executeSetPackages"] call lilc_common_fnc_sendToServer;
