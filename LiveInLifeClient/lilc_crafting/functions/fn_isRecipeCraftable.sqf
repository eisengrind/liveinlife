
private _recipeName = param [0, "", [""]];

try
{
	private _recipeConfig = ([_recipeName] call lilc_crafting_fnc_getRecipeConfig);
	if (isNull _recipeConfig) throw false;
	if (lilc_crafting_active) throw false;
	
	private _position = (["position", "ARRAY", [], _recipeConfig] call lilc_common_fnc_getSetting);
	
	if ((count _position) == 2) then
	{
		switch (_position select 0) do
		{
			case 0:
			{
				if (((([(_position select 1)] call lilc_common_fnc_getDynamicPosition) select 0) distance vehicle player) > 10) throw false;
			};

			case 1:
			{
				private _objects = (nearestObjects [(vehicle player), [(_position select 1)], 10, true]);
				if ((count _objects) <= 0) throw false;
			};
		};
	};

	private _requiredItems = ("true" configClasses (_recipeConfig >> "require"));

	private _hideOnLack = (["hideOnLack", "BOOL", false] call lilc_common_fnc_getSetting);
	if (_hideOnLack) then
	{
		{
			if (([(configName _x)] call lilc_inventory_fnc_itemCount) < getNumber(_x >> "amount")) throw false;
		} forEach _requiredItems;
	};

	private _itemAmount = ([(ctrlText 1401)] call lilc_common_fnc_textToNumber);
	private _itemAmountMultiplier = (
		if (_itemAmount <= 0) then
		{
			1;
		}
		else
		{
			_itemAmount;
		}
	);
	
	if !(
		(
			{
				(([(configName _x), [player, (vehicle player)]] call lilc_inventory_fnc_itemCount) >= (getNumber(_x >> "amount") * _itemAmountMultiplier))
			} count _requiredItems
		)
		isEqualTo
		(
			{
				(isNull (configFile >> "CfgVehicle" >> (configName _x)))
			} count _requiredItems
		)
	) throw false;

	throw true;
}
catch
{
	_exception;
};
