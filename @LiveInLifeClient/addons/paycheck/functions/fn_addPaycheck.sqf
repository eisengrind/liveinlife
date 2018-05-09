
params [
    ["_displayName", "", [""]],
    ["_stmt", {}, [{}]],
    ["_bankName", "", [""]]
];

if (_displayName == "") exitWith { -1; };
if (isNil _stmt) exitWith { -1; };


private _bankCfg = [_bankName] call lilc_bank_fnc_getBankConfig;
if (_bankName != "" && isNull _bankCfg) exitWith { -1; };

private _paychecks = +(lilc_paycheck_paychecks);
private _index = 0;
while { (_index in (_paychecks select 1)); } do {
    _index = _index + 1;
};
lilc_paycheck_paychecks = [_paychecks, _index, [_displayName, _stmt, _bankName]] call CBA_fnc_hashSet;
_index;
