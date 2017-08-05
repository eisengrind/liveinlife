
private ["_result"];
_result = param [0, [], [[], false]];

diag_log str _result;
if ((typeName false) == (typeName _result)) exitWith { endMission "END6"; };
if ((count _result) <= 0) exitWith { lilc_login_profiles = []; };

lilc_login_profiles = _result;
