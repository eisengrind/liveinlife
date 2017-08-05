
try {
    if !(call lilc_pcard_fnc_canCreatePersonalcard) throw false;
    if (dialog) throw false;

    createDialog "lilcm_pcard_createPersonalcard";
    
    lbClear 1574;
    for [{private _i = 1}, {_i < 31}, {_i = _i + 1}] do { lbAdd [1574, ([(str _i), 2, "0"] call lilc_common_fnc_fillString)]; };

    lbClear 1575;
    {
        private _index = lbAdd [1575, _x];
        lbSetData [1575, _index, ([(str (_forEachIndex + 1)), 2, "0"] call lilc_common_fnc_fillString)];
    } forEach ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];

    lbClear 1576;
    for [{private _i = 1920}, {_i < 2001}, {_i = _i + 1}] do { private _index = lbAdd [1576, (str _i)]; };

    ctrlSetText [1577, ""];
    ctrlSetText [1578, ""];
    ctrlSetText [1579, ""];
    ctrlSetText [1580, ""];
} catch {
    _exception;
};
