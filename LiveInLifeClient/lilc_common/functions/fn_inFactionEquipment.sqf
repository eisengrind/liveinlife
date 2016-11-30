
params [
    ["_classname", "", [""]],
    ["_skin", "", [""]]
];

try {
    if (_classname == "") throw -1;
    private _factionConfig = [_factionID] call lilc_common_fnc_getFactionConfig;
    private _factionItems = (_factionConfig select 6);

    {
        if (_classname == (_x select 0) && _skin == (_x select 2)) throw _forEachIndex;
    } forEach _factionItems;

    throw -1;
} catch {
    _exception;
};
