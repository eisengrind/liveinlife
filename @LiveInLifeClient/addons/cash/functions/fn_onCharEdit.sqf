
params [
    ["_control", controlNull, [controlNull, displayNull]],
    ["_keycode", "", ["", 0]]
];

_keyArray = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 14, 211];
if !(_keycode in _keyArray) exitWith {};
call lilc_cash_fnc_updateGiveMenu;
