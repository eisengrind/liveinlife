
//"Menlo, Monaco, 'Courier New', monospace"
params [
	["_location", configNull, ["", configNull]],
	["_recipe", configNull, ["", configNull]]
];

if (_location isEqualType "") then
{
	_location = (missionConfigFile >> "CfgRecipes" >> _location);
};
if (isNull _location) exitWith { false; };

if (_recipe isEqualType "") then
{
	_recipe = (_location >> "recipes" >> _recipe);
};
if (isNull _recipe) exitWith { false; };

private _cN = (configName _location);

private _dC = false;
private _r = getNumber(_location >> "radius");

if (_cN != "player" && (isNull (configFile >> "CfgVehicles" >> _cN))) then
{
	private _p = ([_cN] call lilc_common_fnc_getDynamicPosition);
	if ((count _p) == 2) then
	{
		private _d = (player distance (ASLToAGL (_p select 0)));
		if (_d <= _r) then
		{
			_dC = true;
		};
	};
}
else
{
	if (_cN != "player") then
	{
		private _o = ((position player) nearEntities [_cN, _r]);
		if ((count _o) > 0) then
		{
			_dC = true;
		};
	};
};

if (_cN == "player") then
{
	_dC = true;
};
if !(_dC) exitWith { false; };

private _hD = false;
private _hM = getNumber(_location >> "hideMissing");
{
	systemChat str [_hM, (_x select 3)];
	if (!([(_x select 0), (_x select 1)] call lilc_inventory_fnc_canRemoveMagCount) && ((_hM == 1) || ((_x select 3) == 1))) then
	{
		_hD = true;
	};
} forEach getArray(_recipe >> "tools");

{
	if (([(_x select 0)] call lilc_inventory_fnc_itemCount) < (_x select 1) && ((_hM == 1) || ((_x select 3) == 1))) then
	{
		_hD = true;
	};
} forEach getArray(_recipe >> "requirements");
if (_hD) exitWith { false; };

true;
