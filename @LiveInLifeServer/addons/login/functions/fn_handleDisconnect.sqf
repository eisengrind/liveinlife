
params [
    "_unit",
    "_id",
    "_uid",
    "_name"
];

if (_unit getVariable ["lilc_login_inMenu", false]) exitWith {};

private _aID = (_unit getVariable ["lilc_accountID", 0]);
private _inv = ([_unit] call lilc_inventory_fnc_getInventory);
private _pos = ([_unit] call lilc_common_fnc_getPosition);
private _vInv = (_unit getVariable ["lilc_virtualInventory_inventory", []]);

private _status = (switch (true) do {
    case (_unit getVariable ["ace_captives_isSurrendering", false]): { 1; };
    case (_unit getVariable ["ace_captives_isHandcuffed", false]): { 2; };
    default { 0; };
});

private _prison_escapeTime = (_unit getVariable ["lilc_prison_escapeTime", 0]);
private _prison_waitingTime = (_unit getVariable ["lilc_prison_waitingTime", 0]);
private _prison_punishment = (_unit getVariable ["lilc_prison_currentPunishment", ""]);

[([
    "ACCOUNT_DATA",
    [
        ["GEAR", ([_inv] call lils_common_fnc_arrayEncode)],
        ["LASTPOSITION", ([_pos] call lils_common_fnc_arrayEncode)],
        ["VIRTUALINVENTORY", ([_vInv] call lils_common_fnc_arrayEncode)],
        ["STATUS", _status],
        ["prison_escapeTime", (_unit getVariable ["lilc_prison_escapeTime", 0])],
        ["prison_waitingTime", (_unit getVariable ["lilc_prison_waitingTime", 0])],
        ["prison_currentPunishment", (_unit getVariable ["lilc_prison_currentPunishment", ""])]
    ],
    [
        ["ID", _aID],
        ["STEAM64ID", _uid]
    ]
] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;

deleteVehicle _unit;
false;
