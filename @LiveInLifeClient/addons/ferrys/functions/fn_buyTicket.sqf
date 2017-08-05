
params [
	["_from", "", [""]]
];

private _cfgF = (missionConfigFile >> "CfgFerrys" >> _from);
if (isNull _cfgF) exitWith {};

private _p = getNumber(_cfgF >> "ticketPrice");

if !([_p] call lilc_cash_fnc_have) exitWith
{
	["Du hast nicht genügend Geld.", "ERROR"] call lilc_ui_fnc_hint;
};

if !([player, _p] call lilc_cash_fnc_remove) exitWith
{
	["Du hast nicht genügend Geld.", "ERROR"] call lilc_ui_fnc_hint;
};

if !([player, "lilci_ferryTicket_F", -1, false, false] call lilc_inventory_fnc_add) exitWith
{
	["Es konnte keine Karte hinzugefügt werden.", "ERROR"] call lilc_ui_fnc_hint;
};

["Du hast ein Fährticket gekauft."] call lilc_ui_fnc_hint;
ctrlEnable [2400, true];
