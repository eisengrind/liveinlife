
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    createDialog "lilc_factionsInterface_ranks";
    if (isNull (findDisplay 1400)) throw false;

    call lilc_factionsInterface_fnc_updateRankMenu;
} catch {
    _exception;
};
