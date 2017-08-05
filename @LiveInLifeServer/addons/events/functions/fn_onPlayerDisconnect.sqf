
params [
    ["_unit", objNull, [objNull]],
    ["_id", -1, [0]],
    ["_unitUID", "", [""]]
];

try {
    if (isNull _unit) throw false;
    _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    private _gear = ([_unit] call lilc_inventory_fnc_getInventory);
    private _position = ([_unit] call lilc_common_fnc_getPosition);

    [(format["UPDATE ACCOUNT_DATA SET GEAR = '%1', LASTPOSITION = '%2' WHERE ACCOUNTID = '%3' AND STEAM64ID = '%4'", ([_gear] call lils_common_fnc_arrayEncode), ([_position] call lils_common_fnc_arrayEncode), _accountID, _unitUID])] call lils_database_fnc_query;
    
    deleteVehicle _unit;
    throw true;
} catch {
    _exception;
};
