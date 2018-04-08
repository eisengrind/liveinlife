
params [
    ["_unit", objNull, [objNull]],
    ["_targetRankID", 0, [0]],
    ["_tag", "", [""]],
    ["_name", "", [""]],
    ["_insignia", "", [""]],
    ["_paycheck", -1, [0]],
    ["_permissions", [], [[]]],
    ["_equipment", [], [[]]],
    ["_vehicles", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_targetRankID <= 0) throw false;
    
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if (_tag == "") throw false;
    if (_name == "") throw false;
    if (_paycheck < -1) throw false;

    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);

    _permissions = ([_permissions] call lils_common_fnc_arrayEncode);
    _equipment = ([_equipment] call lils_common_fnc_arrayEncode);
    _vehicles = ([_vehicles] call lils_common_fnc_arrayEncode);

    [(format["UPDATE FACTION_RANK_DATA SET TAG = '""%1""', NAME = '""%2""', INSIGNIA = '""%3""', PRIORITY = '%4', PERMISSIONS = '%5', EQUIPMENT = '%6', VEHICLES = '%7' WHERE ID = '%8'", _tag, _name, _insignia, _paycheck, _permissions, _equipment, _vehicles, _targetRankID])] call lils_database_fnc_query;
    call lilc_factionsInterface_fnc_broadcastRanks;
    throw true;
} catch {
    _exception;
};
