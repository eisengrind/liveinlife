
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_types", [], [[]]]
];
if (isNull _unit || !alive _unit) exitWith {};
if ((_unit getVariable ["lilc_groupID", -1]) != -1) exitWith {};
if ((_unit getVariable ["lilc_accountID", 0]) <= 0) exitWith {};
if ((count _types) <= 0) exitWith {};

_vehicles = [];
_vehicles = [format["SELECT ID, CLASSNAME, FUEL FROM VEHICLES_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2' AND ACTIVE = '0' AND DEAD = '0'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)]] call lils_database_fnc_fetchObjects;

{
    private ["_classname", "_isKindOf", "_index"];
    _classname = (_x select 1);
    _isKindOf = false;
    _index = _forEachIndex;
    
    { if (_x isKindOf _classname) exitWith { _vehicles deleteAt _index; }; } forEach _types;
} forEach _vehicles;

[[_vehicles], "lilc_garage_fnc_updateMenu", _unit] call lilc_common_fnc_send;
