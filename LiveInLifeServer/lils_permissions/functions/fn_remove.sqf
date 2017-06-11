
params [
    ["_accountID", 0, [0]],
    ["_permissions", [], [[], ""]]
];

try {
    if (_permissions isEqualType "") then {
        _permissions = [_permissions];
    };
    if ((count _permissions) <= 0) throw false;
    if (_accountID <= 0) throw false;

    /*{
        if ((_x getVariable ["_accountID", 0]) == _accountID) then {
            [[_permissions], "lilc_permissions_fnc_remove", _x] call lilc_common_fnc_send;
            throw true;
        };
    } forEach playableUnits;*/

    private _unitPermissions = ([format["SELECT PERMISSIONS FROM ACCOUNT_DATA WHERE ID = '%1'", _accountID]] call lils_database_fnc_fetchObjects);
    if ((count _unitPermissions) <= 0) throw false;
    _unitPermissions = (_unitPermissions select 0);
    if ((count _unitPermissions) <= 0) throw false;
    
    private _currentPermissions = ([(_unitPermissions select 0)] call lils_common_fnc_arrayDecode);
    private _newUnitPermissions = ([(_unitPermissions select 0)] call lils_common_fnc_arrayDecode);
    {
        private _permission = _x;
        while { true } do {
            { if (_permission == _x) exitWith { _newUnitPermissions deleteAt _forEachIndex; }; } forEach _newUnitPermissions;
            if !(_permission in _newUnitPermissions) exitWith {};
        };
    } forEach _permissions;

    if (_newUnitPermissions isEqualTo _currentPermissions) throw false;
    [(format["UPDATE ACCOUNT_DATA SET PERMISSIONS = '%1' WHERE ID = '%2'", ([_newUnitPermissions] call lils_common_fnc_arrayEncode), _accountID])] call lils_database_fnc_query;
} catch {
    _exception;
};
