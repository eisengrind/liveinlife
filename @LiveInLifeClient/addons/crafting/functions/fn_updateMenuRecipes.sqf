
params [
	["_searchText", "", ["", []]]
];

if (_searchText isEqualType "") then
{
	_searchText = [_searchText];
};

ctrlEnable [1400, false];
ctrlEnable [1600, false];

lbClear 1500;
lbAdd [1500, "Einträge werden geladen..."];

private _locations = (call lilc_crafting_fnc_availableLocations);

private _rCfgs = [];
{
	private _loc = _x;
	{
		private _r = _x;
		if ([_loc, _r] call lilc_crafting_fnc_isRecipeVisible) then {
			if ((count _searchText) <= 0) then
			{
				_rCfgs pushBack _x;
			}
			else
			{
				{
					if ((getText(_r >> "displayName") find _x) > -1) exitWith { _rCfgs pushBack _r; };
				} forEach _searchText;
			};
		};
	} forEach ("true" configClasses (_loc >> "recipes"));
} forEach _locations;

lbClear 1500;
{
	private _index = (lbAdd [1500, getText(_x >> "displayName")]);
	lbSetPicture [1500, _index, getText(_x >> "picture")];
	private _h = (configHierarchy _x);
	lbSetData [1500, _index, (str [(configName (_h select (((count _h) - 3)))), (configName _x)])];
} forEach _rCfgs;

if ((lbSize 1500) <= 0) then
{
	lbAdd [1500, "Keine Einträge verfügbar."];
};

ctrlEnable [1400, true];
ctrlEnable [1600, true];
