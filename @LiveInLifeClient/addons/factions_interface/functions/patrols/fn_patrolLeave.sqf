
private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

private _mainGroup = allGroups select { (_x getVariable ["lilc_factionID", _factionID]) && (_x getVariable ["lilc_factionMainGroup", false]); };

if ((count _mainGroup) <= 0) then {
    _mainGroup = createGroup civilian;
    _mainGroup setVariable ["lilc_factionID", _factionID, true];
    _mainGroup setVariable ["lilc_factionMainGroup", true, true];
} else {
    _mainGroup = _mainGroup select 0;
};

if ((group player) isEqualTo _mainGroup) exitWith {};

[player] joinSilent _mainGroup;
