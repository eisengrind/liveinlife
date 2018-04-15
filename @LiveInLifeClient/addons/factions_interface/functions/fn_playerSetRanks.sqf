
[_this] params [
    ["_ranks", [], [[]]]
];

if ((count _ranks) <= 0) exitWith {
    lbClear 1500;
    lbAdd [1500, "Keine Ränge vorhanden"];
    lbSetCurSel [1500, 0];
};

{
    private _rank = [_x] call lilc_factions_interface_fnc_getRank;
    private _i = lbAdd [1500, format["%1", _rank select 1]];
    lbSetValue [1500, _i, _x];
    lbSetPicture [1500, _i, [_rank select 4] call lilc_factions_interface_fnc_getInsigniaPath];
} forEach _ranks;
