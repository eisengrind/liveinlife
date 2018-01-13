
params [
    ["_itemClassname", "", [""]],
    ["_shopClassname", "", [""]],
    ["_amount", -1, [-1]]
];
if (_itemClassname == "") exitWith {};
if (_shopClassname == "") exitWith {};
if (_amount <= 0) exitWith {};

_dealerData = [_itemClassname, _shopClassname] call LiveInLifeServer_economy_fnc_getDealerData;
if ((count _dealerData) <= 0) exitWith {};

_itemIndex = ((_dealerData select 1) select 0);
_dealerIndex = ((_dealerData select 1) select 1);

_buys = (((_dealerData select 0) select 2) select 0);
_buys set [0, (_buys + _amount)];

((((lils_economy_data select _itemIndex) select 1) select _dealerIndex) select 2) set [0, _buys];
