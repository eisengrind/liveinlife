
private _searchText = param [0, "", ["", []]];

try
{
	if (_searchText isEqualType "") then
	{
		_searchText = [_searchText];
	};

	disableSerialization;
	private _ui = (findDisplay 1310);
	if (isNull _ui) throw false;

	private _uiListRecipes = (_ui displayCtrl 1500);

	ctrlEnable [1400, false];
	ctrlEnable [1600, false];

	lbClear _uiListRecipes;
	_uiListRecipes lbAdd "Einträge werden geladen...";

	private _foundRecipes = [];
	{
		private _recipe = _x;
		{
			if ([(_recipe select 3), _x] call KRON_StrInStr) then
			{
				_foundRecipes pushBack (_recipe select 0);
			};
		} forEach _searchText;
	} forEach lilc_crafting_recipes;

	lbClear _uiListRecipes;
	{
		private _recipeConfig = ([_x] call lilc_crafting_fnc_getRecipeConfig);

		if ([_x] call lilc_crafting_fnc_isRecipeVisible) then {
			private _index = (_uiListRecipes lbAdd format["%1", getText(_recipeConfig >> "displayName")]);
			_uiListRecipes lbSetPicture [_index, getText(_recipeConfig >> "picture")];
			_uiListRecipes lbSetData [_index, _x];
		};
	} forEach _foundRecipes;

	ctrlEnable [1400, true];
	ctrlEnable [1600, true];
}
catch
{
	_exception;
};
