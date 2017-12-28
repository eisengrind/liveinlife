
params [
	["_unit", objNull, [objNull]],
	["_itemName", "", [""]],
	["_data", nil]
];

if (isNull _unit) exitWith { []; };

private _cfg = ([_itemName] call lilc_virtualInventory_fnc_getVirtualItemConfig);
if (isNull _cfg) exitWith { []; };

try
{
	{
		if ((_x select 0) isEqualTo _itemName) then
		{
			if (isNil "_data") then
			{
				throw _x;
			}
			else
			{
				if ((_x select 2) isEqualTo _data) throw _x;
			};
		};
	} forEach (_unit getVariable ["lilc_virtualInventory_inventory", []]);
	
	throw [];
}
catch
{
	_exception;
};
