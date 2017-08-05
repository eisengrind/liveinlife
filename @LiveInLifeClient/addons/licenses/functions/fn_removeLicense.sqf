
params [
	["_licenseName", "", [""]],
	["_target", ((findDisplay 1301) getVariable ["lilc_licenses_target", objNull]), [objNull]]
];

try
{
	if !([_target] call lilc_common_fnc_isAlive) throw false;
	private _itemConfig = ([_licenseName] call lilc_virtualInventory_fnc_getVirtualItemConfig);
	if (isNull _itemConfig) throw false;
	
	private _itemTypes = getArray(_itemConfig >> "types");
	if !("license" in _itemTypes) throw false;

	[[player, _target, _licenseName, false], "lils_licenses_fnc_setLicense"] call lilc_common_fnc_sendToServer;
}
catch
{
	_exception;
};
