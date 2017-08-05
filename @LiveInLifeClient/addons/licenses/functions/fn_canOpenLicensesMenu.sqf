
params [
	["_target", objNull, [objNull]]
];

try
{
	if !([_target] call lilc_common_fnc_isAlive) throw false;

	private _unitFactionConfig = ([(player getVariable ["lilc_factionID", 0])] call lilc_factions_fnc_getFactionConfig);
	if (isNull _unitFactionConfig) throw false;
	if !(["licenses.open"] call lilc_permissions_fnc_have) throw false;

	private _applicableLicenses = getArray(_unitFactionConfig >> "applicableLicenses");
	if (({
		([(["virtualItem", _x, "add"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have) ||
		([(["virtualItem", _x, "remove"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have)
	} count _applicableLicenses) <= 0) throw false;

	throw true;
}
catch
{
	_exception;
};
