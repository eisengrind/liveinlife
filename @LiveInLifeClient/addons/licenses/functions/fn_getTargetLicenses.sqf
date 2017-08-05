
params [
	["_unit", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;

	private _licenses = [];
	{
		private _itemConfig = ([(_x select 0)] call lilc_virtualInventory_fnc_getVirtualItemConfig);
		if !(isNull _itemConfig) then
		{
			if ("license" in getArray(_itemConfig >> "types")) then
			{
				_licenses pushBack [(_x select 0), (_x select 2)];
			};
		};
	} forEach (player getVariable ["lilc_virtualInventory_inventory", []]);

	[[_licenses], "lilc_licenses_fnc_setLicenses", _unit] call lilc_common_fnc_send;
	throw true;
}
catch
{
	_exception;
};
