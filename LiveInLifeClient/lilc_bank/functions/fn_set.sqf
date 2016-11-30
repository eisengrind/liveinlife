
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_bankAccountID", 0, [0]],
    ["_amount", -1, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_bankAccountID <= 0) throw false;
    if (_amount <= -1) throw false;

    //ID, BANKID, AMOUNT, TYPE
    if (_unit == player) then {
        {
            if ((_x select 0) == _bankAccountID) exitWith {
                (lilc_bank_accounts select _forEachIndex) set [2, _amount];
            };
        } forEach lilc_bank_accounts;
    } else {
        [[_unit, _bankAccountID, _amount], "lilc_bank_fnc_set", _unit] call lilc_common_fnc_send;
    };
} catch {
    _exception;
};
