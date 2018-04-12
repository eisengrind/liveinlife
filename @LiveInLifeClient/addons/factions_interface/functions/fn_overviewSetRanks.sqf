
[_this] params [
    ["_ranks", [], [[]]]
];

lbClear 1501;
{
    private _rank = [_x] call lilc_factions_interface_fnc_getRank;
    private _i = lbAdd [1501, format["%1", _rank select 1]];
    lbSetValue [1501, _i, _x];
    lbSetPicture [1501, _i, [_rank select 4] call lilc_factions_interface_fnc_getInsigniaPath];
} forEach _ranks;
