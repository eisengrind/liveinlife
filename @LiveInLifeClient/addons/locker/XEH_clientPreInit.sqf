
lilc_locker_lockers = [[], []] call CBA_fnc_hashCreate;
lilc_locker_loaded = true;
lilc_locker_currentID = 0;
lilc_locker_currentContainer = objNull;
lilc_locker_onKeyDownIndex = -1;
lilc_locker_onInventoryOpenedIndex = -1;

[
	"set_lilc_locker_lockers",
	{
		{
			[lilc_locker_lockers, (_x select 0), (_x select 1)] call CBA_fnc_hashSet;
		} forEach _this;
	}
] call lilc_login_fnc_addPackage;
