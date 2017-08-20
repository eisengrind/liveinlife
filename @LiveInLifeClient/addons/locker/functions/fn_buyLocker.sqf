
params [
	["_object", objNull, [objNull]]
];

private _name = (_object getVariable ["lilc_locker_name", ""]);

if (_name in lilc_locker_lockers) exitWith {};

private _price = (_object getVariable ["lilc_locker_price", 0]);

private _result = nil;
_result = ([(format["Willst du dieses Schließfach für $%1 kaufen?", _price]), "Schließfach kaufen", "Ja", "Nein"] call BIS_fnc_guiMessage);
waitUntil { !(isNil "_result") };

if !([_price] call lilc_cash_fnc_have) exitWith
{
	["Du hast nicht genügend Geld.", "ERROR"] call lilc_ui_fnc_hint;
};

if !([player, _price] call lilc_cash_fnc_remove) exitWith {};

["Du hast das Schließfach gekauft."] call lilc_ui_fnc_hint;
[lilc_locker_lockers, _name, [[[],[]],[],[[],[]],[]]] call CBA_fnc_hashSet;

[
	_name,
	([lilc_locker_lockers, _name] call CBA_fnc_hashGet)
] call lilc_locker_fnc_saveLocker;
