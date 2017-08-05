
params [
	["_unit", objNull, [objNull]],
	["_vID", 0, [0]],
	["_gN", "", [""]],
	["_t", objNull, [objNull]]
];

if (isNull _unit) exitWith {};
if (_vID <= 0) exitWith {};
if (_gN == "") exitWith {};
if (isNull _t) exitWith {};

private _aID = (_t getVariable ["lilc_accountID", 0]);
if (_aID <= 0) exitWith {};

([([
	"VEHICLES_DATA",
	[
		["ACCOUNTID", _aID],
		["STEAM64ID", (str getPlayerUID _aID)]
	],
	[
		["ACCOUNTID", (_unit getVariable ["lilc_accountID", 0])]
	]
] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query);

[["Dein Fahrzeug wurde erfolgreich übertragen."], "lilc_ui_fnc_hint", _unit] call lilc_common_fnc_send;
[["Du hast ein Fahrzeug erhalten."], "lilc_ui_fnc_hint", _target] call lilc_common_fnc_send;
