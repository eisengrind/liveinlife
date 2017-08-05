
params [
	["_location", configNull, [configNull, ""]],
	["_recipe", configNull, [configNull, ""]]
];

if (_location isEqualType "") then
{
	_location = (missionConfigFile >> "CfgRecipes" >> _location);
};
if (isNull _location) exitWith {};

if (_recipe isEqualType "") then
{
	_recipe = (_location >> "recipes" >> _recipe);
};
if (isNull _recipe) exitWith {};

private _tools = getArray(_recipe >> "tools");
private _reqs = getArray(_recipe >> "requirements");

private _d = false;
{
	if !([(_x select 0), (_x select 1)] call lilc_inventory_fnc_canRemoveMagCount) exitWith
	{
		_d = true;
	};
} forEach _tools;

if (_d) exitWith { false; };

{
	if (([(_x select 0)] call lilc_inventory_fnc_itemCount) < (_x select 2)) exitWith
	{
		_d = true;
	};
} forEach _reqs;

if (_d) exitWith { false; };
true;
