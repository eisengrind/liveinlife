
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

private _buyPrice = getNumber(_config >> "vehicles" >> _classname >> "buyPrice");

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

    throw ([_unit, _classname, _pos, true] call lils_vehicles_fnc_new);
}
catch
{
    [[_exception, _buyPrice], "lilc_shops_fnc_vehicles_buyed", _unit] call lilc_common_fnc_send;
};
