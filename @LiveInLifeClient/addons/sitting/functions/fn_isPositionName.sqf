
params [
	["_classname", "", [""]],
	["_positionName", "", [""]]
];

try
{
	private _seatConfig = (call lilc_sitting_fnc_getSeatsConfig);
	if (isNull _seatConfig) throw false;

	{
		if ((configName _x) == _classname) then
		{
			{
				if ((configName _x) == _positionName) throw true;
			} forEach ("true" configClasses _x);
		};
	} forEach ("true" configClasses _seatConfig);

	throw false;
}
catch
{
	_exception;
};
