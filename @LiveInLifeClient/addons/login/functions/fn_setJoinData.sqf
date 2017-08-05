
/*
	Description:
		processes every data on 1st join:
			format: [[<dataPackageName(string)>, <data(any)>]]
				dataPackageName: name of data set
				data: data, you want to receive or send?
*/

params [
	["_data", [], [[]]]
];

try
{
	["current packages:", "lilc_login"] call lilc_common_fnc_diag_log;
	{
		[(format["Package: %1", _x]), "lilc_login"] call lilc_common_fnc_diag_log;
		["lilce_login_joinDataReceived", _x] call CBA_fnc_localEvent;
	} forEach _data;
	
	[(format["check event result: %1", ""]), "lilc_login"] call lilc_common_fnc_diag_log;
	private _results = (["lilce_login_joinDataReceived_check"] call CBA_fnc_localEventReturn);
	[(format["check event result: %1", _results]), "lilc_login"] call lilc_common_fnc_diag_log;

	if (({ !_x } count _results) > 0) then
	{
		["login failed", "lilc_login"] call lilc_common_fnc_diag_log;
		lilc_login_loginSuccessful = false;
	}
	else
	{
		["login successful", "lilc_login"] call lilc_common_fnc_diag_log;
		lilc_login_loginSuccessful = true;
	};

	throw true;
}
catch
{
	_exception;
};
