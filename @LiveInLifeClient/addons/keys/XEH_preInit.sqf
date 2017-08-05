
[
	"lilce_login_postAccountInit",
	{
		params [
			["_unit", objNull, [objNull]]
		];

		private _factionID = (_unit getVariable ["lilc_factionID", -1]);

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
				} forEach (player getVariable ["lilc_virtualInventory_inventory", []]);

				player setVariable ["lilc_virtualInventory_inventory", _newVirtualInventory, true];
			};

			throw true;
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;
