
[
	"lilce_login_joinDataReceived",
	{
		/*
		example data:
		(_this select 0): identification name of the data package (_this select 1)
		(_this select 1): the send data package
		
		warning:
		this event can be called multiple times (depends on how many data packages you've send on the server)
		*/

		params [
			["_packageName", "", [""]],
			["_packageData", nil]
		];

		try
		{
			if (_packageName != "lilc_login") throw false;
			if (isNil "_packageData") throw false;
			if ((count _packageData) != 26) throw false;

			lilc_player_ID = (_packageData select 0);
			lilc_player_steam64ID = (_packageData select 1);
			lilc_player_thirst = (_packageData select 2);
			lilc_player_hunger = (_packageData select 3);
			lilc_player_cash = (_packageData select 4);
			lilc_player_endurance = (_packageData select 5);
			lilc_player_npcs = (_packageData select 7);
			lilc_player_isNew = (_packageData select 8);
			lilc_player_lastPosition = (_packageData select 9);
			lilc_player_gender = (_packageData select 10);
			lilc_player_faction = [(_packageData select 11), (([(_packageData select 11)] call lilc_common_fnc_getFactionConfig) select 0), (([(_packageData select 11)] call lilc_common_fnc_getFactionConfig) select 4)];
			lilc_player_charisma = (_packageData select 12);
			lilc_player_isRespawning = ([(_packageData select 17)] call lilc_common_fnc_toBool);
			lilc_player_status = (_packageData select 18);
			lilc_permissions_permissions = (_packageData select 19);
			lilc_player_deathTimeout = (_packageData select 20);
			lilc_player_statusTimeout = (_packageData select 21);
			lilc_prison_waitingTime = (_packageData select 22);
			lilc_prison_escapeTime = (_packageData select 23);
			lilc_prison_currentPunishment = (_packageData select 24);
			
			[player, (_packageData select 25)] call lilc_common_fnc_setACEDamage;

			private _coveredDistance = (_packageData select 15); //deprecated (for now)

			lilc_virtualInventory_inventory = (_packageData select 16);

			[player, (_packageData select 6)] call lilc_inventory_fnc_setInventory;

			// gender, firstname, lastname
			player setVariable ["lilc_identity", [lilc_player_gender, (_packageData select 13), (_packageData select 14)], true];
			diag_log str [2, _packageData];
			
			throw true;
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;

[
	"lilce_login_joinDataReceived_check",
	{
		/*try
		{
			if (isNil "lilc_player_ID") throw false;
			if (isNil "lilc_player_steam64ID") throw false;
			if !(lilc_player_ID isEqualType 0) throw false;
			if !(lilc_player_steam64ID isEqualType "") throw false;
			if (lilc_player_ID <= 0) throw false;
			if (lilc_player_steam64ID == "") throw false;

			throw true;
		}
		catch
		{
			_exception;
		};*/
		true;
	}
] call CBA_fnc_addEventHandler;
