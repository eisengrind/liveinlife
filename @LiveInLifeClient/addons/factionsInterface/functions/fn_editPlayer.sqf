
private _factionPlayerID = param [0, 0, [0]];

try {
    if (_factionPlayerID <= 0) throw false;
    if !(["factionsInterface.player.edit"] call lilc_permissions_fnc_have) throw false;

    ["player"] call lilc_factionsInterface_fnc_selectMenu;
    [[player, _factionPlayerID], "lils_factionsInterface_fnc_getPlayerInfo"] call lilc_common_fnc_sendToServer;
    throw false;
} catch {
    _exception;
};
