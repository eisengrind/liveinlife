
params [
    ["_unit", objNull, [objNull]],
    ["_uid", 0, [0]],
    ["_bank", "", [""]]
];

if (isNull _unit) exitWith {};
if (_aid <= 0) exitWith {};

private _bCfg = [_bank] call lilc_bank_fnc_getBankConfig;
if (isNull _bCfg) exitWith {};

private _value = getNumber(_bCfg >> "recruitmentValue");
if (_value <= 0) exitWith {
    [[true], "lilc_atm_fnc_recruitmentCallback", _unit] call lilc_common_fnc_send;
};

private _account = [_uid, _bank] call lils_bank_fnc_getAccount;
if ((count _account) <= 0) exitWith {
    [[false], "lilc_atm_fnc_recruitmentCallback", _unit] call lilc_common_fnc_send;
};

if (!([_account select 0, _value] call lils_bank_fnc_addValue)) exitWith {
    [[true, _uid], "lilc_atm_fnc_recruitmentCallback", _unit] call lilc_common_fnc_send;
};
