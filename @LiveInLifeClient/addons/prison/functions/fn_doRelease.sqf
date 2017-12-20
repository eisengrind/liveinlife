
params [
	["_unit", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_prison_fnc_canRelease) throw false;

	[[], "lilc_prison_fnc_released", _unit] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
