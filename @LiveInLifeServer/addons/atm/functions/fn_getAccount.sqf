
params [
    ["_unit", objNull, [objNull]],
    ["_bank", "", [""]]
];

try {
    if (isNull _unit) throw [];

    private _account = [getPlayerUID _unit, _bank] call lils_bank_fnc_getAccount;
    if ((count _account) <= 0) throw [];

    private _nAccount = [];
    _nAccount set [0, _account select 5];
    _nAccount set [1, _account select 1];
    _nAccount set [2, _account select 2];
    _nAccount set [3, _account select 4];
    _nAccount set [4, _account select 0];

    throw _nAccount;
} catch {
    [_exception, "lilc_atm_fnc_callback_getAccount", _unit] call lilc_common_fnc_send;
};
