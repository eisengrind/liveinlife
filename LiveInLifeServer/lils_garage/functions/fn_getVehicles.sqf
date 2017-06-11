
params [
    ["_unit", objNull, [objNull]],
    ["_garageName", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_garageName == "") throw false;

    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    private _unitUID = (getPlayerUID _unit);
    if (_accountID <= 0) throw false;

    private _vehicles = [];
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

    if (_factionID <= -1) then {
        private _inString = "";
        {
            if (_forEachIndex != 0) then {
                _inString = format["%1,%2", _inString, _x];
            } else {
                _inString = _inString + (str _x);
            };
        } forEach _availableTypes;

        _vehicles = ([(format["SELECT ID, CLASSNAME, COLOR, NICKNAME, FUEL, QUOTE(PLATE) FROM VEHICLES_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2' AND GARAGE = '%3' AND TYPE IN (%4) AND ACTIVE = '0' AND DEAD = '0'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), (if ((getNumber(_garageConfig >> "isLocal")) <= 0) then { """"""; } else { format["""%1""", _garageName]; }), _inString])] call lils_database_fnc_fetchObjects);
    } else {
        private _currentVehicles = ([(format["SELECT VEHICLES FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", _accountID, _unitUID])] call lils_database_fnc_fetchObjects);
        if ((count _currentVehicles) <= 0) throw false;
        _currentVehicles = (_currentVehicles select 0);
        if ((count _currentVehicles) <= 0) throw false;
        _currentVehicles = ([(_currentVehicles select 0)] call lils_common_fnc_arrayDecode);

        {
            if (
                (((getNumber(_garageConfig >> "haveCars")) == 1) && (_x select 0) isKindOf "Car") || 
                (((getNumber(_garageConfig >> "havePlanes")) == 1) && (_x select 0) isKindOf "Plane") || 
                (((getNumber(_garageConfig >> "haveHelicopters")) == 1) && (_x select 0) isKindOf "Helicopter") || 
                (((getNumber(_garageConfig >> "haveTrucks")) == 1) && (_x select 0) isKindOf "Truck") || 
                (((getNumber(_garageConfig >> "haveBoats")) == 1) && (_x select 0) isKindOf "Boat") || 
                (((getNumber(_garageConfig >> "haveSmallCars")) == 1) && (_x select 0) isKindOf "ATV") || 
                (((getNumber(_garageConfig >> "haveBikes")) == 1) && (_x select 0) isKindOf "Bike")
            ) then {
                _vehicles pushBack [-1, (_x select 0), (_x select 1), "", 1, ""];
            };
        } forEach _currentVehicles;
    };

    [[_vehicles], "lilc_garage_fnc_setVehicles", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    if (!_exception) then {
        [[[]], "lilc_garage_fnc_setVehicles", _unit] call lilc_common_fnc_send;
    };
};


