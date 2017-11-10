
lilc_locker_invOpenIndex = player addEventHandler [
	"InventoryOpened",
	{
		params [
			["_unit", objNull, [objNull]],
			["_targetContainer", objNull, [objNull]],
			["_secondaryContainer", objNull, [objNull]]
		];

		try
		{
			private _name = (_targetContainer getVariable ["lilc_locker_name", ""]);
			if (_name == "") throw false;
			if (!([lilc_locker_lockers, _name] call CBA_fnc_hashHasKey) && ((_targetContainer getVariable ["lilc_locker_price", 0]) > 0)) then
			{
				[
					"Du besitzt dieses Schließfach nicht",
					"ERROR"
				] call lilc_ui_fnc_hint;
				throw true;
			}; //price null equls free equals no buying!
			if (!([lilc_locker_lockers, _name] call CBA_fnc_hashHasKey) && ((_targetContainer getVariable ["lilc_locker_price", 0]) <= 0)) then
			{
				[
					lilc_locker_lockers,
					_name,
					[[[],[]],[[],[]],[[],[]],[]]
				] call CBA_fnc_hashSet;
			};

			[_targetContainer] call lilc_inventory_fnc_clearVehicleCargo;
			[_targetContainer, ([lilc_locker_lockers, _name] call CBA_fnc_hashGet)] call lilc_inventory_fnc_setVehicleCargo;

			player removeEventHandler ["InventoryOpened", lilc_locker_invOpenIndex];
			call lilc_locker_fnc_handleInventoryClosed;

			player action ["Gear", _targetContainer];

			true;
		}
		catch
		{
			_exception;
		};
	}
];
