
params [
    "_logic",
    "_units"
];

if (isNull _logic) exitWith {};
if !(isServer) exitWith {};

_units = _units select {
    !hasInterface && !isDedicated;
};

private _apiBank = _logic getVariable ["handleBankAPI", 0];
private _apiUsers = _logic getVariable ["handleUsersAPI", 0];
private _apiExchange = _logic getVariable ["handleExchangeAPI", 0];
private _filters = _logic getVariable ["handleOptionalFilter", ""];

_filters = parseSimpleArray _filters;
_filters = _filters select {
    _x isEqualType "";
};

if (_apiBank == 1 && !("lils_bank" in _filters)) then {
    _filters pushBack "lils_bank";
};

if (_apiUsers == 1 && !("lils_login" in _filters)) then {
    _filters pushBack "lils_login";
};

if (_apiExchange == 1 && !("lils_exchange" in _filters)) then {
    _filters pushBack "lils_exchange";
};

_units apply {
    _x setVariable ["lilc_modules_filters", _filters, true];
    _x;
};
