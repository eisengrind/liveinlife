
params [
	["_itemsToRemove", [], [[]]],
	["_itemsToAdd", [], [[]]]
];

try
{
	{
		[player, _x] call lilc_inventory_fnc_remove;
	} forEach _itemsToRemove;

	{
		[player, _x, -1, false, true] call lilc_inventory_fnc_add;
	} forEach _itemsToAdd;

	["Angebot erfolgreich verhandelt!"] call lilc_ui_fnc_hint;
}
catch
{
	_exception;
};
