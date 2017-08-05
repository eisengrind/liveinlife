
/*
    Filename:
        fn_flipVehicle.sqf
    Author:
        Vincent Heins
    Description:
        Flips a target/given vehicle.
    Params:
        (_this select 0) : _vehicle : <objNull> : vehicle to flip
    Result:
        <bool> : whether the vehicle was flipped or not
*/

private _vehicle = param [0, objNull, [objNull]];

try {
    if (isNull _vehicle) throw false;
    if (isPlayer _vehicle) throw false;
    if !([_vehicle] call lilc_actions_fnc_canFlipVehicle) throw false;

    lilc_action_active = true;
	//{ if (alive _x) then { hint "Es dürfen keine Personen im Fahrzeug sein."; throw false; }; } forEach crew _vehicle;
    _vehicle setVariable ["lilc_flipTimestamp", (time + 6)];
    ["Dein Fahrzeug wird in 5 Sekunden umgedreht.", "WARNING"] call lilc_ui_fnc_hint;
    sleep 5;

    _vehicle allowDamage false;
    private _vehiclePosition = (getPosASL _vehicle);
    _vehiclePosition set [2, ((_vehiclePosition select 2) + 0.2)];

    _vehicle setVectorUp [0, 0, 1];
    _vehicle setPosASL _vehiclePosition;

    ["Du hast das Fahrzeug erfolgreich umgedreht."] call lilc_ui_fnc_hint;
    sleep 1;
    _vehicle allowDamage true;
    lilc_action_active = false;
	throw true;
} catch {
    _exception;
};
