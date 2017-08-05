
#define nIDC 1501
#define sL 20

disableSerialization;
params [
	["_location", "", [configNull, ""]],
	["_recipe", "", [configNull, ""]]
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
private _res = getArray(_recipe >> "results");

private _m = (round (([(ctrlText 1401)] call lilc_common_fnc_textToNumber) max 1));

lbClear nIDC;

if ((count _tools) > 0) then
{
	private _index = (lbAdd [nIDC, (["Benötigte Werkzeuge:"] call lilc_common_fnc_localize)]);
	lbSetColor [nIDC, _index, [1, (162/255), (69/255), 1]];

	{
		private _c = (_x select 0);
		private _iCfg = ([_c] call lilc_common_fnc_getClassnameConfig);
		private _index = (lbAdd [nIDC, (format["%1 (-%2)", ([getText(_iCfg >> "displayName"), sL] call lilc_common_fnc_trimString), (round (((0 max (_x select 2) min 1) * (_x select 1)) * _m))])]);

		if ([_c, (_x select 1) * _m] call lilc_inventory_fnc_canRemoveMagCount) then
		{
			lbSetColor [nIDC, _index, [(157/255), (242/255), (136/255), 1]];
		}
		else
		{
			lbSetColor [nIDC, _index, [(242/255), (99/255), (99/255), 1]];
		};
	} forEach _tools;
};

if ((lbSize nIDC) > 0) then
{
	lbAdd [nIDC, ""];
};

if ((count _reqs) > 0) then
{
	private _index = (lbAdd [nIDC, (["Benötigte Gegenstände:"] call lilc_common_fnc_localize)]);
	lbSetColor [nIDC, _index, [1, (162/255), (69/255), 1]];

	{
		private _c = (_x select 0);
		private _iCfg = ([_c] call lilc_common_fnc_getClassnameConfig);
		private _ch = (_x select 2);
		private _index = (lbAdd [
			nIDC,
			(format[
				"%1x %2",
				(if (_ch < 1) then
				{
					format["~%1", (round (((0 max _ch min 1) * (_x select 1)) * _m))];
				}
				else
				{
					(_x select 1) * _m;
				}),
				([getText(_iCfg >> "displayName"), sL] call lilc_common_fnc_trimString)
			])
		]);

		if (([_c] call lilc_inventory_fnc_itemCount) >= ((_x select 1) * _m)) then
		{
			lbSetColor [nIDC, _index, [(157/255), (242/255), (136/255), 1]];
		}
		else
		{
			lbSetColor [nIDC, _index, [(242/255), (99/255), (99/255), 1]];
		};
	} forEach _reqs;
};

if ((lbSize nIDC) > 0) then
{
	lbAdd [nIDC, ""];
};

private _index = (lbAdd [nIDC, (["Produziert:"] call lilc_common_fnc_localize)]);
lbSetColor [nIDC, _index, [1, (162/255), (69/255), 1]];

if ((count _res) > 0) then
{
	{
		private _c = (_x select 0);
		private _iCfg = ([_c] call lilc_common_fnc_getClassnameConfig);
		private _ch = (_x select 2);
		private _index = (lbAdd [
			nIDC,
			(format[
				"%1x %2",
				(if (_ch < 1) then
				{
					format["~%1", (round (((0 max _ch min 1) * (_x select 1)) * _m))];
				}
				else
				{
					(_x select 1) * _m;
				}),
				([getText(_iCfg >> "displayName"), sL] call lilc_common_fnc_trimString)
			])
		]);
	} forEach _res;
}
else
{
	lbAdd [nIDC, "-"];
};
