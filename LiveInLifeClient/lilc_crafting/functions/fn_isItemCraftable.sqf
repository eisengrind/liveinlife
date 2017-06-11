
private _classname = param [0, "", [""]];

try
{
	if (_classname == "") throw false;

	{
		if (_classname in (_x select 1)) throw true;
	} forEach lilc_crafting_recipes;

	throw false;
}
catch
{
	_exception;
};
