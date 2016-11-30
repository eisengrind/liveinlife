
params [
    ["_itemClassname", "", [""]],
    ["_shopClassname", "", [""]],
    ["_amount", -1, [-1]]
];
if (_itemClassname == "") exitWith {};
if (_shopClassname == "") exitWith {};
if (_amount <= 0) exitWith {};

[[_itemClassname, _shopClassname, _amount], "economy_fnc_processBuy"] call lilc_common_fnc_sendToServer;
