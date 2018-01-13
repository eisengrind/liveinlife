
private _corpse = param [0, objNull, [objNull]];

try {
    if !(alive player) throw false;
    if (isNull _corpse) throw false;
    if !(_corpse getVariable ["lilc_isDead", false]) throw false;
    if !(_corpse getVariable ["lilc_isStabilized", false]) throw false;
    if ((_corpse distance player) > 3) throw false;
    if (lilc_medical_active) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    if (isNull _factionConfig) throw false;
    
    private _canRevive = ([(getNumber(_factionConfig >> "canRevive"))] call lilc_common_fnc_toBool);
    if !(_canRevive) throw false;
    
    private _reviveLocations = getArray(_factionConfig >> "reviveLocations");
    {
        private _pos = ([_x] call lilc_common_fnc_getDynamicPosition);
        if (((ASLToAGL (_pos select 0)) distance player) <= 10) throw true;
    } forEach _reviveLocations;

    throw false;
} catch {
    _exception;
};
