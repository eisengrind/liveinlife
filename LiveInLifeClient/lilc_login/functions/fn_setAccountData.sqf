
private ["_result"];
_result = param [0, [], [[], false]];

if ((typeName false) == (typeName _result)) exitWith { endMission "END6"; };
if ((count _result) <= 0) exitWith { lilc_login_accountInformation = []; };

lilc_login_accountInformation = _result;
