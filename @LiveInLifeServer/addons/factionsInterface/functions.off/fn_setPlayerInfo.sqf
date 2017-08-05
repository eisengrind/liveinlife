//[_unit, _rankID, _equipmentList, _vehicleList],
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_rankID", -1, [0]],
    ["_permissionList", [], [[]]],
    ["_equipmentList", [], [[]]],
    ["_vehicleList", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_rankID <= -1) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    if (_rankID != (_unit getVariable ["lilc_factionRankID", -1])) then {
        _unit setVariable ["lilc_factionRankID", _rankID, true];
    };

    private _availableVehicles = ([(format["SELECT ID, CLASSNAME, COLOR FROM VEHICLES_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", _accountID, (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects);
    private _vehiclesToRemove = [];
    private _vehiclesToAdd = [];

    {
        private _classname = (_x select 0);
        private _color = (_x select 2);
        private _count = (_x select 1);

        if (_count > 0) then {
            private _vehicleCount = ({ (_x select 1) == _classname && (_x select 2) == _color } count _availableVehicles);
            if (_vehicleCount != _count) then {
                if (_vehicleCount > _count) then {
                    for [{_i = 0}, {_i < (_vehicleCount - _count)}, {_i = _i + 1}] do {
                        _vehiclesToRemove pushBack [_classname, _color];
                    };
                } else {
                    for [{_i = 0}, {_i < (_count - _vehicleCount)}, {_i = _i + 1}] do {
                        _vehiclesToAdd pushBack [_classname, _color];
                    };
                };
            };
        };
    } forEach _vehicleList;

    _query = "";
    {
        _query = format["%1DELETE FROM VEHICLES_DATA WHERE ACTIVE = '0' AND DEAD = '0' AND ACCOUNTID = '%2' AND STEAM64ID = '%3' AND CLASSNAME = '""%4""' AND COLOR = '""%5""' LIMIT 1;", _query, _accountID, (getPlayerUID _unit), (_x select 0), (_x select 1)];
    } forEach _vehiclesToRemove;

    {
        private _type = ([(_x select 0)] call lils_garage_fnc_getClassnameType);
        private _garage = ([_type] call lils_garage_fnc_getTypeGarage);
        
        if (_garage != "") then {
            _query = format["%1INSERT INTO VEHICLES_DATA (ID, ACCOUNTID, STEAM64ID, CLASSNAME, ACTIVE, DEAD, POSITION, GEAR, DAMAGE, FUEL, LOCK, COLOR, TYPE, GARAGE, NICKNAME) VALUES (NULL, '%2', '%3', '%4', '0', '0', '""[]""', '""[]""', '""[]""', 1, 1, '""%5""', '%6', '""%7""', '""""')", _query, _accountID, (getPlayerUID _unit), (_x select 0), (_x select 1), _garage];
        };
    } forEach _vehiclesToAdd;
    
    [(format["UPDATE FACTION_PLAYER_DATA SET EQUIPMENT = '%1', VEHICLES = '%2', PERMISSIONS = '%3', RANKID = '%4' WHERE STEAM64ID = '%5' AND ACCOUNTID = '%6'", ([_equipmentList] call lils_common_fnc_arrayEncode), ([_vehicleList] call lils_common_fnc_arrayEncode), ([_permissionList] call lils_common_fnc_arrayEncode), _rankID, (getPlayerUID _unit), _accountID])] call lils_database_fnc_query;
} catch {
    _exception;
};
