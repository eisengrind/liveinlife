
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
] call lilc_login_fnc_addPackage;
