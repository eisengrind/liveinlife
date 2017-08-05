
params [
	["_unit", objNull, [objNull]],
	["_pAndV", [], [[]]]
];

diag_log str ([_pAndV] call CBA_fnc_hashKeys);
{
	diag_log str ([_pAndV, _x] call CBA_fnc_hashGet);
} forEach ([_pAndV] call CBA_fnc_hashKeys);

if (isNull _unit) exitWith {};

private _aID = (_unit getVariable ["lilc_accountID", 0]);
if (_aID <= 0) exitWith {};

if !([_pAndV] call CBA_fnc_isHash) exitWith {};

private _accDataCols = [];
{
	private _k = _x;
	private _v = nil;
	private _v = ([_pAndV, _k] call CBA_fnc_hashGet);

	if (_k isEqualType "" && !isNil "_v") then
	{
		private _c = ([lils_login_packages, _k] call CBA_fnc_hashGet);
		private _r = ([([_unit, _v] call _c)] param [0, false]);
		
		if !(isNil "_r") then
		{
			if (_r isEqualType []) then
			{
				if ((count _r) == 2 || (count _r) == 3) then
				{
					_accDataCols pushBack _r;
				};
			};
		};
	};
} forEach ([_pAndV] call CBA_fnc_hashKeys);

if ((count _accDataCols) > 0) then
{
	[([
		"ACCOUNT_DATA",
		_accDataCols,
		[
			["ID", _aID]
		]
	] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
};
