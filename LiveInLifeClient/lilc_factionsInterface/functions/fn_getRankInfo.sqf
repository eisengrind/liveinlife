
//[ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA]
private _rankID = param [0, 0, [0]];

try {
    if (_rankID <= 0) throw [];
    {
        if ((_x select 0) == _rankID) throw _x;
    } forEach lilc_factionsInterface_ranks;

    throw [];
} catch {
    _exception;
};
