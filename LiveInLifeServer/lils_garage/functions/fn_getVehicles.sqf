
params [
    ["_unit", objNull, [objNull]],
    ["_garageName", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _availableTypes = [];
    if ((getNumber(_garageConfig >> "haveCars")) >= 1) then { _availableTypes pushBack 0; };
    if ((getNumber(_garageConfig >> "havePlanes")) >= 1) then { _availableTypes pushBack 1; };
    if ((getNumber(_garageConfig >> "haveHelicopters")) >= 1) then { _availableTypes pushBack 2; };
    if ((getNumber(_garageConfig >> "haveTrucks")) >= 1) then { _availableTypes pushBack 3; };
    if ((getNumber(_garageConfig >> "haveBoats")) >= 1) then { _availableTypes pushBack 4; };
    if ((getNumber(_garageConfig >> "haveSmallCars")) >= 1) then { _availableTypes pushBack 5; };
    if ((getNumber(_garageConfig >> "haveBikes")) >= 1) then { _availableTypes pushBack 6; };

    if ((count _availableTypes) <= 0) throw false;

    private _inString = "";
    {
        if (_forEachIndex != 0) then {
            _inString = format["%1,%2", _inString, _x];
        } else {
            _inString = _inString + (str _x);
        };
    } forEach _availableTypes;

    private _vehicles = ([(format["SELECT ID, CLASSNAME, COLOR, NICKNAME, FUEL, DAMAGE FROM VEHICLES_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2' AND GARAGE = '%3' AND TYPE IN (%4) AND ACTIVE = '0' AND DEAD = '0'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), (if ((getNumber(_garageConfig >> "isLocal")) <= 0) then { """"""; } else { format["""%1""", _garageName]; }), _inString])] call lils_database_fnc_fetchObjects);
    
    [[_vehicles], "lilc_garage_fnc_setVehicles", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    if (!_exception) then {
        [[[]], "lilc_garage_fnc_setVehicles", _unit] call lilc_common_fnc_send;
    };
};


