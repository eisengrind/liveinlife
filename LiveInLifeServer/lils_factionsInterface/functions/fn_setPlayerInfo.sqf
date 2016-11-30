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

    [(format["UPDATE FACTION_PLAYER_DATA SET EQUIPMENT = '%1', VEHICLES = '%2', PERMISSIONS = '%3', RANKID = '%4' WHERE STEAM64ID = '%5' AND ACCOUNTID = '%6'", ([_equipmentList] call lils_common_fnc_arrayEncode), ([_vehicleList] call lils_common_fnc_arrayEncode), ([_permissionList] call lils_common_fnc_arrayEncode), _rankID, (getPlayerUID _unit), _accountID])] call lils_database_fnc_query;
} catch {
    _exception;
};
