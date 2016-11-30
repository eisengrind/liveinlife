
if (!alive player) exitWith { endMission "END6"; };
[[player], "lils_login_fnc_returnAccountData"] call lilc_common_fnc_sendToServer;
