
lilc_crafting_active = false;
lilc_crafting_recipes = [];

{
	private _recipe = _x;

	private _result = [];
	{
		_result pushBack (configName _x);
	} forEach ("true" configClasses (_recipe >> "result"));

	private _require = [];
	{
		_require pushBack (configName _x);
	} forEach ("true" configClasses (_recipe >> "require"));

	lilc_crafting_recipes pushBack [(configName _recipe), _require, _result, getText(_recipe >> "displayName")];
} forEach ("true" configClasses (missionConfigFile >> "CfgRecipes"));
