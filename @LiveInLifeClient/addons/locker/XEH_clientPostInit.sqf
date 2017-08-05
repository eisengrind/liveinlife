
/*
new concept:

global objects:
	-> converted to local objects
	-> id variable
	-> price variable
	-> title variable
*/

{
	private _id = (_x getVariable ["lilc_lockers_id", ""]);
	if (_id != "" && !(local _x)) then
	{
		_x hideObject true;
		_x allowDamage false;
		private _nV = ((typeOf _x) createVehicleLocal [0, 0, 0]);
		[_nV, ([_x] call lilc_common_fnc_getPosition)] call lilc_common_fnc_setPosition;
		_nV allowDamage false;
		[_x, false] call ace_cargo_fnc_makeLoadable;
		[_nV, false] call ace_cargo_fnc_makeLoadable;
		_nV setVariable ["lilc_lockers_id", _id];
		_nV setVariable ["lilc_lockers_title", (_x getVariable ["lilc_lockers_title", ""])];
		_nV setVariable ["lilc_lockers_price", (_x getVariable ["lilc_lockers_price", 0])];		

		_nV addAction [
			"Schließfach kaufen",
			{
				(_this select 0) call lilc_locker_fnc_buyLocker;
			},
			0,
			0,
			false,
			false,
			"",
			"!((_target getVariable ['lilc_locker_id', '']) in ([lilc_locker_lockers] call CBA_fnc_hashKeys))",
			5
		];
	};
} forEach allMissionObjects "All";

player addEventHandler ["InventoryClosed", {
	params [
		["_unit", objNull, [objNull]],
		["_container", objNull, [objNull]]
	];

	private _id = (_container getVariable ["lilc_lockers_id", ""]);
	if (_id == "") exitWith { false; };
	if !(_id in ([lilc_locker_lockers] call CBA_fnc_hashKeys)) exitWith { true; };
	if !(lilc_locker_loaded) exitWith { false; };

	private _vC = ([_container] call lilc_inventory_fnc_getVehicleCargo);
	[lilc_locker_lockers, _id, _vC] call CBA_fnc_hashSet;
	[[player, _id, _vC], "lils_locker_fnc_save"] call lilc_common_fnc_sendToServer;
}];

lilc_locker_onInventoryOpenedIndex = (player addEventHandler ["InventoryOpened", {
	params [
		["_unit", objNull, [objNull]],
		["_container", objNull, [objNull]]
	];

	private _id = (_container getVariable ["lilc_lockers_id", ""]);
	if (_id == "") exitWith { false; };
	if !(_id in ([lilc_locker_lockers] call CBA_fnc_hashKeys)) exitWith { true; };
	
	lilc_locker_loaded = false;

	[_container, ([_id] call CBA_fnc_hashGet)] call lilc_inventory_fnc_setVehicleCargo;

	lilc_locker_loaded = true;
	false;
}]);
