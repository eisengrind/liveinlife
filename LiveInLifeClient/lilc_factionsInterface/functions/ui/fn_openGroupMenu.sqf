
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    createDialog "lilc_factionsInterface_groups";

    if (isNull (findDisplay 1374)) throw false;

    call lilc_factionsInterface_fnc_updateGroupMenu;
} catch {
    _exception;
};
