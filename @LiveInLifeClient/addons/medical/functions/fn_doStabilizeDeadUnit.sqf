//"UnconsciousReviveMedic_A", , 


private _corpse = param [0, objNull, [objNull]];

try {
    if (isNil "lilc_medical_active") then { lilc_medical_active = false; };
    if !([_corpse] call lilc_medical_fnc_canStabilizeDeadUnit) throw false;

    lilc_medical_active = true;
    lilc_medical_animationActive = true;
    player switchMove "UnconsciousReviveMedic_A";

    private _point1 = (_corpse modelToWorld [0.782227,0.342773,-0.0316651]);
    private _point2 = (_corpse modelToWorld [-0.791016,0.206543,0]);
    if ((_point1 distance player) > (_point2 distance player)) then {
        player setPosASL AGLToASL _point2;
    } else {
        player setPosASL AGLToASL _point1;
    };
    player setDir ((position player) getDir (position _corpse));
    
    lilc_medical_animIndex = player addEventHandler ["AnimDone", {
        player removeEventHandler ["AnimDone", lilc_medical_animIndex];
        player switchMove "";
        lilc_medical_animationActive = false;
    }];

    waitUntil { !lilc_medical_animationActive };

    if !([player, "lilci_cervicalCollar_F"] call lilc_inventory_fnc_remove) throw false;
    [[player], "lilc_medical_fnc_stabilized", _corpse] call lilc_common_fnc_send;
    _corpse setVariable ["lilc_isStabilized", true, true];
    hint "stabilized?";
    throw true;
} catch {
    lilc_medical_active = false;
    _exception;
};

