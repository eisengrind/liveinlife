
params [
    ["_target", objNull, [objNull]]
];

if !([_target] call lilc_common_fnc_isAlive) exitWith { false };

private _unitFactionConfig = ([(player getVariable ["lilc_factionID", 0])] call lilc_factions_fnc_getFactionConfig);
if (isNull _unitFactionConfig) exitWith { false };
if !(["licenses.open"] call lilc_permissions_fnc_have) exitWith { false };

private _applicableLicenses = getArray(_unitFactionConfig >> "applicableLicenses");
(({
    ([(["licenses", _x, "add"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have) ||
    ([(["licenses", _x, "remove"] call lilc_permissions_fnc_bindPermissionTree)] call lilc_permissions_fnc_have)
} count _applicableLicenses) > 0);
