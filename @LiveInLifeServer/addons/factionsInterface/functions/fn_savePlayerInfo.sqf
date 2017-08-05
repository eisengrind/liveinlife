
params [
    ["_unit", objNull, [objNull]],
    ["_targetAccountID", 0, [0]],
    ["_selectedRank", 0, [0]],
    ["_permissions", [], [[]]],
    ["_equipment", [], [[]]],
    ["_vehicles", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_targetAccountID <= 0) throw false;
    
    systemChat str _targetAccountID;
    {
        if (isPlayer _x && (_x getVariable ["lilc_accountID", 0]) == _targetAccountID) exitWith {
            _x setVariable ["lilc_factionRankID", _selectedRank, true];
        };
    } forEach playableUnits;

    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    
    private _toRemove = [];
    private _toAdd = [];
    {
        if (_x in _permissions) then {
            _toAdd pushBack _x;
        } else {
            _toRemove pushBack _x;
        };
    } forEach (["factionsInterface.dashboard", "factionsInterface.player.edit", "factionsInterface.rank.edit", "factionsInterface.rank.add", "factionsInterface.rank.remove"] + getArray(_factionConfig >> "selectablePermissions"));

    [_targetAccountID, _toRemove, _toAdd] call lils_permissions_fnc_addAndRemove;
    
    private _availableUnits = (playableUnits select { ((_x getVariable ["lilc_accountID", 0]) == _targetAccountID) });
    
    if ((count _availableUnits) == 1) then
    {
        [[_vehicles, _equipment], "lilc_factionsInterface_fnc_setAvailables", (_availableUnits select 0)] call lilc_common_fnc_send;
    };

    _equipment = ([_equipment] call lils_common_fnc_arrayEncode);
    _vehicles = ([_vehicles] call lils_common_fnc_arrayEncode);

    [(format["UPDATE FACTION_PLAYER_DATA SET EQUIPMENT = '%1', VEHICLES = '%2', RANKID = '%3' WHERE ACCOUNTID = '%4'", _equipment, _vehicles, _selectedRank, _targetAccountID])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
