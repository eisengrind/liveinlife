
lils_login_set_defPackages = [
	"set_lil_login_id",
	"set_lil_login_thirst",
	"set_lil_login_hunger",
	"set_lil_login_cash",
	"set_lil_login_endurance",
	"set_lil_login_lastPosition",
	"set_lil_login_identity",
	"set_lil_login_charisma",
	"set_lil_login_status",
	"set_lil_respawn_deathTimeout",
	"set_lil_login_statusTimeout",
	"set_lil_login_damage",
	"set_lil_respawn_respawning",
	"set_lil_bank_accounts",
	"set_lil_virtualInventory_inventory",
	"set_lil_perms_perms",
	"set_lil_inventory_inventory",
	"set_lilc_locker_lockers",
	"set_lil_factions_faction"
];

[
	"set_lil_login_id",
	{
		_dbCol = [
			"ID",
			true,
			false,
			{
				params [
					["_unit", objNull, [objNull]],
					["_value", 0, [0]]
				];

				_unit setVariable ["lilc_accountID", _value, true];
			}
		];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_thirst",
	{
		_dbCol = ["THIRST", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_hunger",
	{
		_dbCol = ["HUNGER", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_cash",
	{
		_dbCol = ["CASH", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_endurance",
	{
		_dbCol = ["ENDURANCE", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_lastPosition",
	{
		_dbCol = ["LASTPOSITION", true, true];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_identity",
	{
		_dbCol = [["GENDER", true, false], ["FIRSTNAME", true, false], ["LASTNAME", true, false]];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_charisma",
	{
		_dbCol = ["CHARISMA", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_status",
	{
		_dbCol = ["STATUS", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_respawn_deathTimeout",
	{
		_dbCol = ["DEATHTIMEOUT", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_statusTimeout",
	{
		_dbCol = ["STATUSTIMEOUT", true, false];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_login_damage",
	{
		_dbCol = ["health", true, true];
	}
] call lils_login_fnc_addPackage;

[
	"set_lil_respawn_respawning",
	{
		_dbCol = ["RESPAWNING", true, false];
	}
] call lils_login_fnc_addPackage;

/*********
SET END / UDPATE START
*********/

lils_login_update_defPackages = [
	
];

[
	"update_lil_login_thirst",
	{
		["THIRST", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_hunger",
	{
		["HUNGER", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_cash",
	{
		["CASH", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_endurance",
	{
		["ENDURANCE", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_inventory_gear",
	{
		["GEAR", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_lastPosition",
	{
		["LASTPOSITION", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_charisma",
	{
		["CHARISMA", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_bank_accounts",
	{
		_this call lils_bank_fnc_setBankAccounts;
		false;
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_status",
	{
		["STATUS", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_login_statusTimeout",
	{
		["STATUSTIMEOUT", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_perms_perms",
	{
		["PERMISSIONS", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_respawn_respawning",
	{
		["RESPAWNING", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_respawn_currentTimeout",
	{
		["DEATHTIMEOUT", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_prison_waitingTime",
	{
		["prison_waitingTime", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_prison_escapeTime",
	{
		["prison_escapeTime", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

[
	"update_lil_prison_currentPMent",
	{
		["prison_currentPunishment", (_this select 1)];
	}
] call lils_login_fnc_addPackage;

/*
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

			diag_log str 1;
			if ((count _result) <= 0) throw ["lilc_login", [0]];
			_result = (_result select 0);

			diag_log str 2;
			if ((count _result) != 26) throw ["lilc_login", [0]];

			private _lockers = ([([
				"LOCKER_DATA",
				[
					["ID"],
					["GEAR"]
				],
				[
					["ACCOUNTID", _accountID]
				]
			] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

			private _arrLockers = [];
			{
				_arrLockers pushBack [(_x select 0), ([(_x select 1)] call lils_common_fnc_arrayDecode)];
			} forEach _lockers;

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

			_result pushBack _arrLockers;
			diag_log str _arrLockers;

			throw ["lilc_login", _result];
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;*/
