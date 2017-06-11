
private _recipeName = param [0, "", [""]];

try
{
	private _recipeConfig = ([_recipeName] call lilc_crafting_fnc_getRecipeConfig);
	if (isNull _recipeConfig) throw false;

	disableSerialization;
	private _ui = (findDisplay 1310);
	if (isNull _ui) throw false;

	private _uiListNeeded = (_ui displayCtrl 1501);

	lbClear _uiListNeeded;

	private _index = (_uiListNeeded lbAdd (["Benötigte Objekte:"] call lilc_common_fnc_localize));
	_uiListNeeded lbSetColor [_index, [1, (162/255), (69/255), 1]];
	_uiListNeeded lbSetData [_index, ""];

	private _requiredItems = ("true" configClasses (_recipeConfig >> "require"));
	private _resultedItems = ("true" configClasses (_recipeConfig >> "result"));

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
	
	ctrlEnable [1601, ([_recipeName] call lilc_crafting_fnc_isRecipeCraftable)];

	if ((count _requiredItems) <= 0) then
	{
		_uiListNeeded lbAdd "Keine";
	}
	else
	{
		{
			private _classname = (configName _x);
			private _color = getText(_x >> "color");
			private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
			private _amount = getNumber(_x >> "amount");
			private _index = (_uiListNeeded lbAdd format["%1x %2", (_amount * _itemAmountMultiplier), getText(_itemConfig >> "displayName")]);

			_uiListNeeded lbSetData [_index, (str [_classname, _color])];
			_uiListNeeded lbSetPicture [_index, getText(_itemConfig >> "picture")];
			_uiListNeeded lbSetValue [_index, 1];

			if ((isNull (configFile >> "CfgVehicles" >> _classname)) && (([_classname, [player, (vehicle player)]] call lilc_inventory_fnc_itemCount) >= (_amount * _itemAmountMultiplier))) then
			{
				_uiListNeeded lbSetColor [_index, [(157/255), (242/255), (136/255), 1]];
			}
			else
			{
				_uiListNeeded lbSetColor [_index, [(242/255), (99/255), (99/255), 1]];
			};
		} forEach _requiredItems;
	};

	_index = (_uiListNeeded lbAdd "");
	_uiListNeeded lbSetData [_index, ""];

	_index = (_uiListNeeded lbAdd (["Produziert:"] call lilc_common_fnc_localize));
	_uiListNeeded lbSetColor [_index, [1, (162/255), (69/255), 1]];
	_uiListNeeded lbSetData [_index, ""];

	{
		private _classname = (configName _x);
		private _amount = getNumber(_x >> "amount");

		private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);

		private _index = (_uiListNeeded lbAdd format["%1x %2", _amount, getText(_itemConfig >> "displayName")]);
		_uiListNeeded lbSetPicture [_index, getText(_itemConfig >> "picture")];
		_uiListNeeded lbSetData [_index, ""];
		_uiListNeeded lbSetValue [_index, 0];
	} forEach _resultedItems;

	_index = (_uiListNeeded lbAdd "");
	_uiListNeeded lbSetData [_index, ""];

	_index = (_uiListNeeded lbAdd (["Weiterverwendung:"] call lilc_common_fnc_localize));
	_uiListNeeded lbSetColor [_index, [1, (162/255), (69/255), 1]];
	_uiListNeeded lbSetData [_index, ""];

	private _usedRecipes = ([_recipeName] call lilc_crafting_fnc_getRecipeUsages);

	{
		if ([_x] call lilc_crafting_fnc_isRecipeVisible) then
		{
			private _currentRecipeConfig = ([_x] call lilc_crafting_fnc_getRecipeConfig);
			private _index = (_uiListNeeded lbAdd format["%1", getText(_currentRecipeConfig >> "displayName")]);
			_uiListNeeded lbSetPicture [_index, getText(_recipeConfig >> "picture")];
			_uiListNeeded lbSetData [_index, _x];
			_uiListNeeded lbSetValue [_index, 2];
		};
	} forEach _usedRecipes;

	if (({ ([_x] call lilc_crafting_fnc_isRecipeVisible) } count _usedRecipes) <= 0) then
	{
		_uiListNeeded lbAdd "Keine";
	};
}
catch
{
	_exception;
};
