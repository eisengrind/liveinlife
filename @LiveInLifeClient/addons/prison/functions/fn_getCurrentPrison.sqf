
params [
	["_punishmentName", "", [""]]
];

try
{
	private _punishmentConfig = ([_punishmentName] call lilc_prison_fnc_getPunishmentConfig);
	if (isNull _punishmentConfig) throw "";

	{
		private _prisonConfig = ([_x] call lilc_prison_fnc_getPrisonConfig);
		if (player inArea getText(_prisonConfig >> "markerName")) throw _x;
	} forEach getArray(_punishmentConfig >> "prisons");

	throw "";
}
catch
{
	_exception;
};
