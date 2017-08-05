
params [
	["_unit", objNull, [objNull]]
];

try
{
	systemChat str _this;
	if !([_unit] call lilc_prison_fnc_canRelease) throw false;
	systemChat str 1;

	[[], "lilc_prison_fnc_released", _unit] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
