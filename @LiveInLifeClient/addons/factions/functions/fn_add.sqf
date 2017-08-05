
private _factionID = (player getVariable ["lilc_factionID", -1]);
if (_factionID < 0) exitWith { false; }; 
if (!alive player) exitWith { false; }; 
 
private _factionInfo = ([_factionID] call lilc_common_fnc_getFactionConfig);
private _factionVar = (group player) getVariable ["lilc_factionID", -1]; 
if (_factionVar == _factionID && _factionVar != -1) exitWith { true; }; 
 
private _faction = grpNull; 

if ((_factionInfo select 8) == 1) then {
    {
        private ["_currentID"];
        private _currentID = _x getVariable ["lilc_factionID", -1];
        if ((_factionID == _currentID) && (!isNull _x)) then { 
            _faction = _x; 
        }; 
    } forEach allGroups; 
    
    if (isNull _faction) then { 
        _faction = createGroup civilian; 
        _faction setVariable ["lilc_factionID", _factionID, true];
        _faction setVariable ["lilc_factionMainGroup", true, true];
    };
} else {
    _faction = createGroup civilian;
    _faction setVariable ["lilc_factionID", _factionID, true];
    _faction setVariable ["lilc_factionMainGroup", false, true];
};
 
[player] joinSilent _faction;
true;