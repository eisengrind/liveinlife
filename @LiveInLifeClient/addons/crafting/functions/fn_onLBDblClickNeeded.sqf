
/*disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_index", -1, [0]]
];

try
{
	if (isNull _control) throw false;
	if (_index <= -1) throw false;

	private _data = (_control lbData _index);
	if ((_control lbValue _index) == 1) then
	{
		if !([_data] call lilc_crafting_fnc_isItemCraftable) throw false;
	}
	else
	{
		if (isNull ([(_control lbData _index)] call lilc_crafting_fnc_getRecipeConfig)) throw false;
	};

	private _text = (_control lbText _index);
	if (_text == "") throw false;

	[_text] call lilc_crafting_fnc_updateMenuRecipes;

	for "_i" from 0 to ((lbSize 1500) - 1) do
	{
		if ((lbText [1500, _i]) == _text) exitWith
		{
			lbSetCurSel [1500, _i];
		};
	};

	_control lbSetCurSel -1;

	throw true;
}
catch
{
	_exception;
};*/
