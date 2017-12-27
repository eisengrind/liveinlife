
/*
new concept:

global objects:
	-> converted to local objects
	-> id variable
	-> price variable
*/

call lilc_locker_fnc_handleInventoryOpened;

{
	private _name = (_x getVariable ["lilc_locker_name", ""]);
	private _price = (_x getVariable ["lilc_locker_price", 0]);

	if (!isNull _x && (_name != "") && ((!(local _x) && isMultiplayer) || !isMultiplayer)) then
	{
		_x enableSimulation false;
		_x allowDamage false;
		hideObject _x;

		private _c = (typeOf _x);
		private _pos = ([_x] call lilc_common_fnc_getPosition);

		private _vG = (_c createVehicleLocal [0, 0, 0]);
		[_vG, _pos] call lilc_common_fnc_setPosition;
		[_vG] call lilc_inventory_fnc_clearVehicleCargo;
		_vG enableSimulation false;
		_vG allowDamage false;
		_vG hideObject false;
		_vG setVariable ["lilc_locker_name", _name];
		_vG setVariable ["lilc_locker_price", _price];

		if !([lilc_locker_lockers, _name] call CBA_fnc_hashHasKey) then
		{
			private _i = (_vG addAction [
				"Schließfach kaufen",
				{
					(_this select 0) call lilc_locker_fnc_buyLocker;
				},
				0,
				0,
				false,
				false,
				"",
				"!([lilc_locker_lockers, (_target getVariable ['lilc_locker_name', ''])] call CBA_fnc_hashHasKey)",
				10
			]);

			_vG setVariable ["lilc_locker_actionIndex", _i];
		};

		_vG enableSimulation true;
	};
} forEach allMissionObjects "All";
