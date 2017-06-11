
params [
    ["_control", controlNull, [controlNull]],
    ["_keyCode", 0, [0]],
    ["_shift", false, [false]],
    ["_ctrl", false, [false]],
    ["_alt", false, [false]]
];

if !(dialog) exitWith {};
if !(_keyCode in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 71, 72, 73, 75, 76, 77, 79, 80, 81, 82]) exitWith { true; };

private _text = (ctrlText 1581);
if ((count _text) > 4) then {
    _text = ([_text, 4] call KRON_StrRight);
    ctrlSetText [1581, _text];
    lilc_transponder_currentCode = _text;
};

true;
