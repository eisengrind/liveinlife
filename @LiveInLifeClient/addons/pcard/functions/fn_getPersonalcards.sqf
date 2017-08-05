
try {
    private _personalCards = [];
    {
        if ("lilcvi_personalcard_F" == (_x select 0)) then {
            _personalCards pushBack _x;
        };
    } forEach (player getVariable ["lilc_virtualInventory_inventory", []]);

    throw _personalCards;
} catch {
    _exception;
};
