
private _vehicles = ([([
	"VEHICLES_DATA",
	[
		["ID"]
	],
	[
		["ACTIVE", 1],
		["DEAD", 0]
	]
] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

{
	private _vehicleID = (_x select 0);

	private _vehicleData = ([([
		"VEHICLES_DATA",
		[
			["ACCOUNTID"], //0
			["QUOTE(STEAM64ID)", false], //1
			["CLASSNAME"], //2
			["POSITION"], //3
			["GEAR"], //4
			["DAMAGE"], //5
			["FUEL"], //6
			["LOCK"], //7
			["COLOR"], //8
			["NICKNAME"], //9
			["QUOTE(PLATE)", false], //10
			["upgrades"], //11
			["cracked"] //12
		],
		[
			["ID", _vehicleID]
		]
	] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

	if ((count _vehicleData) != 1) throw false;
	_vehicleData = (_vehicleData select 0);
	if ((count _vehicleData) != 13) throw false;

	_vehicleData set [3, ([(_vehicleData select 3)] call lils_common_fnc_arrayDecode)];
	_vehicleData set [4, ([(_vehicleData select 4)] call lils_common_fnc_arrayDecode)];
	_vehicleData set [11, ([(_vehicleData select 11)] call lils_common_fnc_arrayDecode)];

	private _vehicle = ([
		(_vehicleData select 2),
		(_vehicleData select 3),
		_vehicleID,
		(_vehicleData select 0),
		(_vehicleData select 1),
		true,
		-1
	] call lils_vehicles_fnc_create);

	_vehicle setVariable ["lilc_vehicleColor", (_vehicleData select 8), true];
	[
		_vehicle,
		(if ((_vehicleData select 7) == 1) then { 2; } else { 0; })
	] call lilc_vehicles_fnc_lock;
} forEach _vehicles;
