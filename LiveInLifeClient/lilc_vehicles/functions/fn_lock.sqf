
params [
	["_vehicle", objNull, [objNull]],
	["_status", 0, [0, false]]
];

try
{
	if (isNull _vehicle) throw false;

	if (local _vehicle) then
	{
		_vehicle lock _status;
	}
	else
	{
		if (isRemoteExecuted) then
		{
			_vehicle lock _status;
		}
		else
		{
			[[_vehicle, _status], "lilc_vehicles_fnc_lock", 0] call lilc_common_fnc_send;
		};
	};
}
catch
{
	_exception;
};
