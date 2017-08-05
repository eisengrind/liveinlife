
disableSerialization;
params [
    ["_control", controlNull, [controlNull, displayNull]],
    ["_keyCode", "", ["", 0]]
];

_keyArray = [101, 46, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
if !(_keyCode in _keyArray) exitWith {};
sleep 0.001;

private _amount = ([(ctrlText 1401)] call lilc_common_fnc_textToNumber);
if (_amount > 100) then
{
	ctrlSetText [1401, "100"];
};

if (_amount <= 0) then
{
	ctrlSetText [1401, "1"];
};

(call compile (lbData [1500, (lbCurSel 1500)])) call lilc_crafting_fnc_updateMenuNeeded;
