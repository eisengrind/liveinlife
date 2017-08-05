
private _rankID = param [0, 0, [0]];

try {
    if (_rankID <= 0) throw "";
    //[ID, NAME, TAG, FACTIONID, PRIORITY, INSIGNIA]
    private _rankInfo = [_rankID] call lilc_factionsInterface_fnc_getRankInfo;
    if ((count _rankInfo) <= 0) throw "";
    
    private _rankTag = "";
    _rankTag = (_rankInfo select 2);

    if (_rankTag != "") then {
        _rankTag = (format["%1.", _rankTag]);
    };

    throw _rankTag;
} catch {
    _exception;
};
