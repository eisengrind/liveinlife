
params [
	["_target", objNull, [objNull]]
];

try
{
	if !([_target] call lilc_licenses_fnc_canOpenLicensesMenu) throw false;

	[_target] call lilc_licenses_fnc_openMenu;
	throw true;
}
catch
{
	_exception;
};
