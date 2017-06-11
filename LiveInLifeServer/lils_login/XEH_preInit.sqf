
[
	"lilse_login_getJoinData",
	{
		params [
			["_unit", objNull, [objNull]],
			["_accountID", 0, [0]]
		];

		try
		{
			if (_accountID <= 0) throw ["lilc_login", [0]];
			if (isNull _unit) throw ["lilc_login", [0]];

			_factionPlayer = [];
			_result = [];

			_result = ([([
				"ACCOUNT_DATA",
				[
					["ID"], // 0
					["QUOTE(STEAM64ID)", false], // 1
					["THIRST"], // 2
					["HUNGER"], // 3
					["CASH"], // 4
					["ENDURANCE"], // 5
					["GEAR"], // 6
					["NPCS"], // 7
					["NEW"], // 8
					["LASTPOSITION"], // 9
					["GENDER"], // 10
					["GROUP"], // 11
					["CHARISMA"], // 12
					["FIRSTNAME"], // 13
					["LASTNAME"], // 14
					["COVERED_DISTANCE"], // 15
					["VIRTUALINVENTORY"], // 16
					["RESPAWNING"], // 17
					["STATUS"], // 18
					["PERMISSIONS"], // 19
					["DEATHTIMEOUT"], // 20
					["STATUSTIMEOUT"], // 21
					["prison_waitingTime"], //22
					["prison_escapeTime"], //23
					["prison_currentPunishment"], //24
					["health"] //25
				],
				[
					["STEAM64ID", (if ((getPlayerUID _unit) == "_SP_PLAYER_") then { "76561198040411592"; } else { (getPlayerUID _unit); })],
					["ID", _accountID]
				],
				"LIMIT 1"
			] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

			if ((count _result) <= 0) throw ["lilc_login", [0]];
			_result = (_result select 0);

			if ((count _result) != 26) throw ["lilc_login", [0]];

			_result set [6, ([(_result select 6)] call lils_common_fnc_arrayDecode)];
			_result set [7, ([(_result select 7)] call lils_common_fnc_arrayDecode)];
			_result set [9, ([(_result select 9)] call lils_common_fnc_arrayDecode)];
			_result set [15, ([(_result select 15)] call lils_common_fnc_arrayDecode)];
			_result set [16, ([(_result select 16)] call lils_common_fnc_arrayDecode)];
			_result set [19, ([(_result select 19)] call lils_common_fnc_arrayDecode)];
			_result set [25, ([(_result select 25)] call lils_common_fnc_arrayDecode)];

			//[_unit, _accountID, (_result select 13)] call lils_login_fnc_setPlayerInfo;
			_unit setVariable ["lilc_factionID", (_result select 11), true];
			_unit setVariable ["lilc_accountID", _accountID, true];
			[_unit] call lils_factionsInterface_fnc_setFactionInfo;

			throw ["lilc_login", _result];
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;
