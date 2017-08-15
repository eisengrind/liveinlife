
[
	"set_lilc_locker_lockers",
	{
		params [
			["_unit", objNull, [objNull]]
		];
		private _result = ([([
			"LOCKER_DATA",
			[
				["LOCKER"],
				["GEAR"]
			],
			[
				["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])]
			]
		] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

		_result set [1, ([(_result select 1)] call lils_common_fnc_arrayEncode)];
		_result;
	}
] call lils_login_fnc_addPackage;

[
	"update_lilc_locker_lockers",
	{
		params [
			["_unit", objNull, [objNull]],
			["_v", nil]
		];

		if (isNil "_v") exitWith { false; };
		if !(_v isEqualType []) exitWith { false; };

		private _aID = (_unit getVariable ["lilc_accountID", 0]);
		if (_aID <= 0) exitWith { false; };

		{
			private _val = ([_x] call CBA_fnc_hashGet);
			private _res = nil;
			_res = ([([
				"LOCKER_DATA",
				[
					["ID"]
				],
				[
					["ACCOUNTID", _aID],
					["LOCKER", _x]
				]
			] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

			if (_res isEqualType []) then
			{
				if ((count _res) <= 0) then
				{
					[([
						"LOCKER_DATA",
						 [
							 ["LOCKER", _x],
							 ["GEAR", _val, true],
							 ["ACCOUNTID", _aID]
						 ]
					] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;
				}
				else
				{
					[([
						"LOCKER_DATA",
						[
							["GEAR", _val, true]
						],
						[
							["ACCOUNDID", _aID],
							["LOCKER", _x]
						]
					] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
				};
			};
		} forEach ([_v] call CBA_fnc_hashKeys);

		true;
	}
] call lils_login_fnc_addPackage;
