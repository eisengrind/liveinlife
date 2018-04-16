
//input = players [[<AID>, <firstname>, <lastname>, <rankID>], ..., n]

[_this] params [
    ["_players", [], [[]]]
];

if !(dialog) exitWith {};

lbClear 1500;
{
    _x params [
        ["_accountID", 0, [0]],
        ["_firstname", "", [""]],
        ["_lastname", "", [""]],
        ["_rankID", 0, [0]]
    ];

    private _isOnline = ({ (alive _x && (_x getVariable ["lilc_accountID", 0]) == _accountID); } count allPlayers) == 1;

    private _rank = [_rankID] call lilc_factions_interface_fnc_getRank;
    private _i = lbAdd [1500, format["%1%2 %3 (%4)",
        (if (isNil { _rank select 2; }) then {
            "";
        } else {
            format["%1. ", _rank select 2];
        }),
        _firstname,
        _lastname,
        (if (_isOnline) then {
            "Online";
        } else {
            "Offline";
        })
    ]];
    lbSetValue [1500, _i, _accountID];
    lbSetPicture [1500, _i, [(if (isNil { _rank select 4; }) then { ""; } else { ""; })] call lilc_factions_interface_fnc_getInsigniaPath];
} forEach _players;
