
_vehicle = param [0, ObjNull, [ObjNull]];
if (isNull _vehicle) exitWith {};
if (lilc_action_active) exitWith {};

_result = false;
try {
    if ((typeOf _vehicle) == "GroundWeaponHolder") then { throw false; } else { if !((locked _vehicle) >= 2) then { throw false; } else { throw true; };};
} catch {
    if !(_exception) then {
        _result = false;
        lilc_events_fnc_inventoryOpen = true;
    } else {
        _result = true;
        hint "Dieses Fahrzeug ist abgeschlossen.";
    };
};
_result;
