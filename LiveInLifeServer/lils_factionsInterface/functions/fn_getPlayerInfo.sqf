
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_sender", ObjNull, [ObjNull]]
];

try {
    if (isNull _unit) throw false;
    if (isNull _sender) throw false;
    if (!isPlayer _unit) throw false;
    if (!isPlayer _sender) throw false;

    private _result = ([(format["SELECT PERMISSIONS, EQUIPMENT, VEHICLES FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects);
    _result = (_result select 0);
    _result set [0, ([(_result select 0)] call lils_common_fnc_arrayDecode)];
    _result set [1, ([(_result select 1)] call lils_common_fnc_arrayDecode)];
    _result set [2, ([(_result select 2)] call lils_common_fnc_arrayDecode)];
    
    [_result, "lilc_factionsInterface_fnc_setPlayerInfo", _sender] call lilc_common_fnc_send;
} catch {
    _exception;
};
