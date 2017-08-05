
private _rankID = param [0, 0, [0]];

try {
    if (_rankID <= 0) throw false;
    if !(["factionsInterface.rank.edit"] call lilc_permissions_fnc_have) throw false;

    ["rank"] call lilc_factionsInterface_fnc_selectMenu;
    [[player, _rankID], "lils_factionsInterface_fnc_getRankInfo"] call lilc_common_fnc_sendToServer;
    throw false;
} catch {
    _exception;
};
