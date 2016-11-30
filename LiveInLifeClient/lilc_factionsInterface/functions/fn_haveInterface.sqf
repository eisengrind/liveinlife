
try {
    if (isNull player) throw false;
    if !(isPlayer player) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if (_factionID != (lilc_player_faction select 0)) throw false;

    private _factionConfig = ([_factionID] call lilc_common_fnc_getFactionConfig);
    if ((_factionConfig select 9) == 0) throw false;

    throw true;
} catch {
    _exception;
};
