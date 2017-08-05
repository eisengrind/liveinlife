
params [
	["_unit", objNull, [objNull]],
	["_aID", 0, [0]],
	["_packs", lils_login_set_defPackages, [[]]]
];

if (isNull _unit) exitWith {};
if (_aID isEqualTo 0) exitWith {};
if ((count _packs) <= 0) exitWith {};

private _dbCs = [];
private _packages = ([[], nil] call CBA_fnc_hashCreate);
_dbCol = nil;
{
	private _k = _x;
	private _c = ([lils_login_packages, _k] call CBA_fnc_hashGet);

	_dbCol = nil;
	private _res = nil;

	if !(isNil _c) then
	{
		_res = ([_unit] call _c);
	}
	else
	{
		([_unit] call _c);
	};

	if !(isNil "_dbcol") then
	{
		if (_dbCol isEqualType []) then
		{
			if ((_dbCol select 0) isEqualType []) then
			{
				{
					_dbCs pushBack [_k, [(_x select 0), (_x select 1)], (_x select 2), (_x param [3, {}, [{}]])];
				} forEach _dbCol;
			}
			else
			{
				_dbCs pushBack [_k, [(_dbCol select 0), (_dbCol select 1)], (_dbCol select 2), (_dbCol param [3, {}, [{}]])];
			};
		}
		else
		{
			[_packages, _k, _res] call CBA_fnc_hashSet;
		};
	}
	else
	{
		[_packages, _k, _res] call CBA_fnc_hashSet;
	};
} forEach _packs;

private _result = ([([
	"ACCOUNT_DATA",
	(_dbCs apply { (_x select 1); }),
	[
		["ID", _aID]
	]
] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

try
{
	if ((count _result) != 1) throw false;
	
	_result = (_result select 0);
	if ((count _result) != (count _dbCs)) throw false;

	{
		private _dbC = (_dbCs select _forEachIndex);
		private _v = _x;

		if (_dbC select 2) then
		{
			_v = ([_v] call lils_common_fnc_arrayDecode);
		};

		private _hV = ([_packages, (_dbC select 0)] call CBA_fnc_hashGet);
		if !(isNil "_hV") then
		{
			if (_hV isEqualType []) then
			{
				_hV pushBack _v;
				[_packages, (_dbC select 0), _hV] call CBA_fnc_hashSet;
			}
			else
			{
				[_packages, (_dbC select 0), [_hV, _v]] call CBA_fnc_hashSet;
			};
		}
		else
		{
			[_packages, (_dbC select 0), _v] call CBA_fnc_hashSet;
		};

		private _c = (_dbC param [3, {}, [{}]]);
		([_unit, _v] call _c); //unit, value
	} forEach _result;
}
catch
{
	{
		[_packages, (_x select 0), nil] call CBA_fnc_hashSet;
	} forEach _dbCs;
};

[_packages, "lilc_login_fnc_executeSetPackages", _unit] call lilc_common_fnc_send;
