
private ["_playerGroupID", "_playerGroupName", "_faction", "_factionVar"]; 
_playerGroupID = lilc_player_faction select 0;
if (_playerGroupID < 0) exitWith { false; }; 
if (!alive player) exitWith { false; }; 
 
private _factionInfo = ([_playerGroupID] call lilc_common_fnc_getFactionConfig);
_factionVar = (group player) getVariable ["lilc_factionID", -1]; 
if (_factionVar == _playerGroupID && _factionVar != -1) exitWith { true; }; 
 
_faction = grpNull; 

if ((_factionInfo select 8) == 1) then {
    {
        private ["_currentID"];
        _currentID = _x getVariable ["lilc_factionID", -1];
        if ((_playerGroupID == _currentID) && (!isNull _x)) then { 
            _faction = _x; 
        }; 
    } forEach allGroups; 
    
    if (isNull _faction) then { 
        _faction = createGroup civilian; 
        _faction setVariable ["lilc_factionID", _playerGroupID, true];
        _faction setVariable ["lilc_factionMainGroup", true, true];
    };
} else {
    _faction = createGroup civilian;
    _faction setVariable ["lilc_factionID", _playerGroupID, true];
    _faction setVariable ["lilc_factionMainGroup", false, true];
};
 
[player] joinSilent _faction;
true;