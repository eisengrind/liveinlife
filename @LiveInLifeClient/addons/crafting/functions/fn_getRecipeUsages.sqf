


private _recipeName = param [0, "", [""]];

try
{
	try
	{
		{
			if ((_x select 0) == _recipeName) throw _x;
		} forEach lilc_crafting_recipes;

		throw [];
	}
	catch
	{
		if ((count _exception) == 4) then
		{
			private _recipeResultItems = (_exception select 2);

			private _recipes = [];
			{
				private _recipe = _x;
				if ((_recipe select 0) != _recipeName && !((_recipe select 0) in _recipes)) then
				{
					try
					{
						{
							if (_x in (_recipe select 1)) then
							{
								_recipes pushBack (_recipe select 0);
								throw true;
							};
						} forEach _recipeResultItems;

						throw false;
					}
					catch
					{
						_exception;
					};
				};
			} forEach lilc_crafting_recipes;

			throw _recipes;
		};

		throw [];
	};

	throw [];
}
catch
{
	_exception;
};
