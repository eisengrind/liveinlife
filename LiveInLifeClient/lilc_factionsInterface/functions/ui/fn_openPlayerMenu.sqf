
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    createDialog "lilc_factionsInterface_players";
    
    if (isNull (findDisplay 1385)) throw false;

    call lilc_factionsInterface_fnc_updatePlayerMenu;
} catch {
    _exception;
};
