
params [
    ["_rankID", 0, [0]]
];

if (_rankID <= 0) exitWith {};

private _rankName = ctrlText 1400;
private _rankTag = ctrlText 1401;
private _rankInsignia = lbData [2100, lbCurSel 2100];
private _rankPaycheck = parseNumber lbData [2101, lbCurSel 2101];

private _rankItems = [];
for "_i" from 0 to (lbSize 1502) - 1 do {
    if (lnbValue [1502, [_i, 2]] == 1) then {
        _rankItems pushBack (lnbData [1502, [_i, 1]]);
    };
};

private _rankPermissions = [];
for "_i" from 0 to (lbSize 1500) - 1 do {
    if (lnbValue [1500, [_i, 2]] == 1) then {
        _rankPermissions pushBack (lnbData [1500, [_i, 1]]);
    };
};

private _rankVehicles = [];
for "_i" from 0 to (lbSize 1501) - 1 do {
    if (lnbValue [1500, [_i, 2]] == 1) then {
        _rankVehicles pushBack (lnbData [1500, [_i, 1]]);
    };
};

[[player, _rankID, _rankName, _rankTag, _rankInsignia, _rankPaycheck, _rankItems, _rankPermissions, _rankVehicles], "lils_factions_interface_fnc_setRank"] call lilc_common_fnc_sendToServer;
