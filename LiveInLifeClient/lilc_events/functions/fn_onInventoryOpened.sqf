
_vehicle = param [0, ObjNull, [ObjNull]];
if (isNull _vehicle) exitWith {};

_result = false;
try {
    if ((typeOf _vehicle) == "GroundWeaponHolder") then { throw false; } else { if !((locked _vehicle) >= 2) then { throw false; } else { throw true; };};
} catch {
    if !(_exception) then {
        _result = false;
    } else {
        _result = true;
        hint "Dieses Fahrzeug ist abgeschlossen.";
    };
};
_result;
