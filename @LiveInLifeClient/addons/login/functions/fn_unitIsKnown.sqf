
private _unit = param [0, ObjNull, [ObjNull]];

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith { false; };
if !(isPlayer _unit) exitWith { false; };

if ((_unit getVariable ["lilc_accountID", 0]) in (profileNamespace getVariable ["lilc_knownUnits", []])) exitWith { true; };
false;
