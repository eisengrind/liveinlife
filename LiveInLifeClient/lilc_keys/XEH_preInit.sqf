
[
	"lilce_common_initPlayer",
	{
		params [
			["_factionID", -1, [0]],
			["_accountID", 0, [0]]
		];

		try
		{
			private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
			private _globalKeys = (getNumber(_factionConfig >> "globalVehicleLock"));

			if ((_factionID > -1 && _globalKeys != 1) || _factionID <= -1) then
			{
				private _vehicleIDs = [];
				_vehicleIDs = ((allMissionObjects "All") apply { (_x getVariable ["lilc_vehicleID", 0]); });
				_vehicleIDs = (_vehicleIDs select { (_x > 0); });

				private _newVirtualInventory = [];
				{
					private _vItem = _x;
					
					if (((_vItem select 0) == "lilcvi_key_F" && ((_vItem select 2) in _vehicleIDs)) || ((_vItem select 0) != "lilcvi_key_F")) then
					{
						_newVirtualInventory pushBack _vItem;
					}
				} forEach lilc_virtualInventory_inventory;

				lilc_virtualInventory_inventory = _newVirtualInventory;
			};

			throw true;
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;
