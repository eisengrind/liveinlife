
private _rankID = param [0, 0, [0]];

try {
    if (_rankID <= 0) throw false;
    if !(["factionsInterface.rank.remove"] call lilc_permissions_fnc_have) throw false;
    
    [[player, _rankID], "lils_factionsInterface_fnc_removeRank"] call lilc_common_fnc_sendToServer;
    throw true;
} catch {
    _exception;
};
