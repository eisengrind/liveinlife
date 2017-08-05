
[
	"lilse_login_getJoinData",
	{
		params [
			["_unit", ObjNull, [ObjNull]],
			["_accountID", 0, [0]]
		];

		try
		{
			if !([_unit] call lilc_common_fnc_isAlive) throw ["lilc_factionsInterface_availables", []];
			if (_accountID <= 0) throw ["lilc_factionsInterface_availables", []];
			
			private _result = ([([
				"FACTION_PLAYER_DATA",
				[
					["VEHICLES"],
					["EQUIPMENT"]
				],
				[
					["ACCOUNTID", _accountID]
				]
			] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);
			
			if ((count _result) != 1) throw ["lilc_factionsInterface_availables", []];
			_result = (_result select 0);
			if ((count _result) != 2) throw ["lilc_factionsInterface_availables", []];

			throw [
				"lilc_factionsInterface_availables",
				[
					([(_result select 0)] call lils_common_fnc_arrayDecode),
					([(_result select 1)] call lils_common_fnc_arrayDecode)
				]
			];
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;

[
	"lilse_common_afterDatabaseInitialization",
	{
		call lils_factionsInterface_fnc_init;
	}
] call CBA_fnc_addEventHandler;
