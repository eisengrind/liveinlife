
params [
    ["_accountID", 0, [0]],
    ["_toRemove", [], [[], ""]],
    ["_toAdd", [], [[], ""]]
];

try {
    if (_toRemove isEqualType "") then { _toRemove = [_toRemove]; };
    if (_toAdd isEqualType "") then { _toAdd = [_toAdd]; };
    if ((count _toRemove) <= 0 && (count _toAdd) <= 0) throw false;
    if (_accountID <= 0) throw false;

    {
        if ((_x getVariable ["_accountID", 0]) == _accountID) then {
            [[_permissions], "lilc_permissions_fnc_remove", _x] call lilc_common_fnc_send;
            throw true;
        };
    } forEach playableUnits;

    {
        if ((_x getVariable ["_accountID", 0]) == _accountID) then {
            [[_permissions], "lilc_permissions_fnc_add", _x] call lilc_common_fnc_send;
            throw true;
        };
    } forEach playableUnits;
    
    private _unitPermissions = ([format["SELECT PERMISSIONS FROM ACCOUNT_DATA WHERE ID = '%1'", _accountID]] call lils_database_fnc_fetchObjects);
    if ((count _unitPermissions) <= 0) throw false;
    _unitPermissions = (_unitPermissions select 0);
    if ((count _unitPermissions) <= 0) throw false;

    private _currentPermissions = ([(_unitPermissions select 0)] call lils_common_fnc_arrayDecode);
    private _newPermissions = ([(_unitPermissions select 0)] call lils_common_fnc_arrayDecode);

    {
        private _permission = _x;
        while { true } do {
            { if (_permission == _x) exitWith { _newPermissions deleteAt _forEachIndex; }; } forEach _newPermissions;
            if !(_permission in _newPermissions) exitWith {};
        };
    } forEach _toRemove;

    {
        if !([_x, _newPermissions] call lilc_permissions_fnc_have) then {
            _newPermissions pushBack _x;
        };
    } forEach _toAdd;

    diag_log str [_toRemove, _toAdd, _currentPermissions, _newPermissions];
    if (_newPermissions isEqualTo _currentPermissions) throw false;
    [(format["UPDATE ACCOUNT_DATA SET PERMISSIONS = '%1' WHERE ID = '%2'", ([_newPermissions] call lils_common_fnc_arrayEncode), _accountID])] call lils_database_fnc_query;

    throw true;
} catch {
    _exception;
};
