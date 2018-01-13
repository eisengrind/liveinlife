
private _corpse = param [0, objNull, [objNull]];

try {
    if !(alive player) throw false;
    if (isNull _corpse) throw false;
    if !(isPlayer _corpse) throw false;
    if !(alive _corpse) throw false;
    if !(_corpse getVariable ["lilc_isDead", false]) throw false;
    if (_corpse getVariable ["lilc_isStabilized", false]) throw false;
    if ((_corpse distance player) > 3) throw false;
    if ((["lilci_cervicalCollar_F"] call lilc_inventory_fnc_itemCount) <= 0) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
    if (isNull _factionConfig) throw false;
    
    private _canRevive = ([(getNumber(_factionConfig >> "canStabilize"))] call lilc_common_fnc_toBool);
    if !(_canRevive) throw false;

    throw true;
} catch {
    _exception;
};
