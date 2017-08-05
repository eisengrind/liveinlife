
params [
    ["_unit", objNull, [objNull]],
    ["_lockerID", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_lockerID <= 0) throw false;
    
    private _lockerGear = [(format["SELECT GEAR FROM LOCKER_DATA WHERE ID = '%1' AND ACCOUNTID = '%2' AND STEAM64ID = '%3'", _lockerID, (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;
    if ((count _lockerGear) != 1) throw false;
    _lockerGear = (_lockerGear select 0);
    
    if ((count _lockerGear) != 1) throw false;
    _lockerGear = ([(_lockerGear select 0)] call lils_common_fnc_arrayDecode);

    [[_lockerGear], "lilc_locker_fnc_loaded", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    if !(_exception) then {
        [[[]], "lilc_locker_fnc_loaded", _unit] call lilc_common_fnc_send;
    };
};
