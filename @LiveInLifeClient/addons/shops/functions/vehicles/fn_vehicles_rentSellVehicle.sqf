
params [
    ["_shopName", "", [""]]
];

if (_shopName == "") exitWith {};

private _config = (missionConfigFile >> "CfgVehicleShops" >> _shopName);
if (isNull _config) exitWith {};

private _garages = getArray(_config >> "returnGarages") + [configName _config];
private _positions = ((getArray (_config >> "positions")) apply { ([_x] call lilc_common_fnc_getDynamicPosition); });

private _aID = (player getVariable ["lilc_accountID", 0]);
if (_aID <= 0) exitWith {};

private _fID = (player getVariable ["lilc_factionID", -1]);

private _veh = objNull;
{
    private _nearestObjects = nearestObjects [(ASLToAGL (_x select 0)), ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter", "Bicycle"], 10, true];

    {
        if ((_x getVariable ["lilc_rentShop", ""]) in _garages && (_x getVariable ["lilc_isRented", false]) && ((_x getVariable ["lilc_accountID", 0]) == _aID) && ((_x getVariable ["lilc_factionID", -1]) == _fID)) exitWith {
            _veh = _x;
        };
    } forEach _nearestObjects;

    if !(isNull _veh) exitWith {};
} forEach _positions;

if (isNull _veh) exitWith
{
    [
        "Es gibt kein gemietetes Fahrzeug in der Nähe.",
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

private _vehCfg = (_config >> "vehicles" >> (typeOf _veh));
if (isNull _vehCfg) exitWith
{
    [
        "Diese Fahrzeug-Vermietung vermietet dieses Fahrzeug nicht.",
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

if ([getNumber(_vehCfg >> "rentSellPrice")] call lilc_cash_fnc_add) then
{
    [_vehicle] call lilc_vehicles_fnc_deleteVehicle;
    [
        "Du hast ein gemietetes Fahrzeug zurückgebenen."
    ] call lilc_ui_fnc_hint;
};
