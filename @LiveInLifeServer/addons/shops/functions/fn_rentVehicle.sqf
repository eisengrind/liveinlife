
params [
	["_unit", objNull, [objNull]],
	["_shopName", "", [""]],
	["_classname", "", [""]]
];

if (isNull _unit) exitWith {};
if (_shopName == "") exitWith {};
if (_classname == "") exitWith {};

private _config = (missionConfigFile >> "CfgVehicleShops" >> _shopName);
if (isNull _config) exitWith {};

private _vehCfg = ([_classname] call lilc_common_fnc_getClassnameConfig);
if (isNull _vehCfg) exitWith {};

private _rentPrice = getNumber(_config >> "vehicles" >> _classname >> "rentBuyPrice");

try
{
	private _positions = ((getArray (_config >> "positions")) apply { ([_x] call lilc_common_fnc_getDynamicPosition); });
	if ((count _positions) <= 0) throw false;

	private _pos = [];
	{
		if !([(_x select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) exitWith
		{
			_pos = (_positions select 0);
		};
	} forEach _positions;
	if ((count _pos) <= 0) throw false;

	private _vehicle = (_classname createVehicle [0, 0, 0]);
	_vehicle allowDamage false;
	_vehicle setVariable ["lilc_isRented", true, true];
	_vehicle setVariable ["lilc_accountID", (_unit getVariable ["lilc_accountID", 0]), true];
	_vehicle setVariable ["lilc_factionID", (_unit getVariable ["lilc_factionID", -1]), true];
	_vehicle setVariable ["lilc_uniqueObjectID", (parseNumber (((_vehicle call BIS_fnc_netId) splitString ":") select 1)), true];
	_vehicle addEventHandler [
        "Killed",
        {
            _this call lils_vehicles_fnc_vehicleDeath;
            [
                "lilse_vehicles_vehicleDeath",
                _this
            ] call CBA_fnc_localEvent;
        }
    ];
	[_vehicle] call lilc_inventory_fnc_clearVehicleCargo;
	_vehicle allowDamage true;
	[_vehicle, _pos] call lilc_common_fnc_setPosition;
	throw true;
}
catch
{
	[[_exception, _rentPrice], "lilc_shops_fnc_vehicles_buyed", _unit] call lilc_common_fnc_send;
};
