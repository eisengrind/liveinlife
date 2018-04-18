
params [
    ["_unit", objNull, [objNull]],
    ["_name", "", [""]],
    ["_tag", "", [""]],
    ["_insignia", "", [""]],
    ["_paycheck", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if (_name == "") throw false;
    if (_tag == "") throw false;
    
    [(format["INSERT INTO FACTION_RANK_DATA (ID, FACTIONID, NAME, TAG, DESCRIPTION, VEHICLES, EQUIPMENT, PERMISSIONS, PRIORITY, INSIGNIA) VALUES (NULL, '%1', '""%2""', '""%3""', '""""', '""[]""', '""[]""', '""[]""', '%4', '""%5""')", _factionID, _name, _tag, _paycheck, _insignia])] call lils_database_fnc_query;
    call lils_factionsInterface_fnc_broadcastRanks;
    throw true;
} catch {
    _exception;
};
