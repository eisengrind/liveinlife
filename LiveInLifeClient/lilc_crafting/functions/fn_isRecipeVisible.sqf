
private _recipeName = param [0, "", [""]];

try
{
	private _recipeConfig = ([_recipeName] call lilc_crafting_fnc_getRecipeConfig);
	if (isNull _recipeConfig) throw false;

	private _requiredItems = ("true" configClasses (_recipeConfig >> "require"));

	private _positions = (["position", "ARRAY", [], _recipeConfig] call lilc_common_fnc_getSetting);
	private _showWhileOutsidePosition = (["showWhileOutsidePosition", "BOOL", false, _recipeConfig] call lilc_common_fnc_getSetting);

	private _nearbyPositions = ({
		if ((count _x) == 2 && (_x isEqualType [])) then
		{
			private _position = _x;
			private _classname = (_x select 0);
			private _radius = (_x select 1);
			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

			private _result = false;
			if !(isNull _itemConfig) then
			{
				if ((count (nearestObjects [(vehicle player), [_classname], _radius, true])) > 0) then
				{
					_result = true;
				}
				else
				{
					_result = false;
				};
			}
			else
			{
				if (((([_classname] call lilc_common_fnc_getDynamicPosition) select 0) distance vehicle player) <= _radius) then
				{
					_result = true;
				}
				else
				{
					_result = false;
				};
			};
			
			_result;
		}
		else
		{
			false;
		};
	} count _positions);
	if (!_showWhileOutsidePosition && _nearbyPositions <= 0) throw false;

	private _hideOnLack = (["hideOnLack", "BOOL", false] call lilc_common_fnc_getSetting);
	if (_hideOnLack) then
	{
		{
			if (([(configName _x)] call lilc_inventory_fnc_itemCount) < getNumber(_x >> "amount")) throw false;
		} forEach _requiredItems;
	};

	{
		if (
			(["hideOnLack", "BOOL", false, _x] call lilc_common_fnc_getSetting) &&
			(([(configName _x)] call lilc_inventory_fnc_itemCount) < getNumber(_x >> "amount"))
		) throw false;
	} forEach _requiredItems;

	throw true;
}
catch
{
	_exception;
};
