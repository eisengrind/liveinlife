
[_this] params [
    ["_ranks", [], [[]]]
];

if ((count _ranks) <= 0) exitWith {
    lbClear 2100;
    lbAdd [2100, "Keine Ränge vorhanden"];
    lbSetCurSel [2100, 0];
};

lbClear 2100;
{
    private _rank = [_x] call lilc_factions_interface_fnc_getRank;
    private _i = lbAdd [2100, format["%1", _rank select 1]];
    lbSetValue [2100, _i, _x];
    lbSetPicture [2100, _i, [_rank select 4] call lilc_factions_interface_fnc_getInsigniaPath];
} forEach _ranks;
