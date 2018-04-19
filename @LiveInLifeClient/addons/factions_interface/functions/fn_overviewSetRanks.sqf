
[_this] params [
    ["_ranks", [], [[]]]
];

lbClear 1501;
{
    private _rank = [_x select 0] call lilc_factions_interface_fnc_getRank;
    private _i = lbAdd [1501, format["%1", _rank select 1]];
    lbSetValue [1501, _i, _x select 1];
    lbSetData [1501, _i, str (_x select 0)];
    lbSetPicture [1501, _i, [_rank select 4] call lilc_factions_interface_fnc_getInsigniaPath];
} forEach _ranks;

lbSortByValue 1501;
