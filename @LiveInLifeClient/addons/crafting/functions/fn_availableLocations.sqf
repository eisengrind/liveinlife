
_locations = [];
{
	private _cN = (configName _x);
	private _r = getNumber(_x >> "radius");
	if (_cN == "player") then
	{
		_locations pushBack _x;
	}
	else
	{
		if (isNull (configFile >> "CfgVehicles" >> _cN)) then
		{
			private _p = ([_cN, "ATL"] call lilc_common_fnc_getDynamicPosition);
			if ((count _p) == 2) then
			{
				if (((_p select 0) distance player) <= _r) then
				{
					_locations pushBack _x;
				};
			};
		}
		else
		{
			private _o = (position player nearEntities [_cN, _r]);
			_o = _o select { ([_x] call lilc_keys_fnc_have); };
			if ((count _o) > 0) then
			{
				_locations pushBack _x;
			};
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgRecipes"));
_locations;
