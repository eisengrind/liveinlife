
_cocoa = param [0, ObjNull, [ObjNull]];
if (isNull _cocoa) exitWith {};
if ((_cocoa distance2D player) > 10) exitWith {};
if !(((getModelInfo _cocoa) select 0) == "t_cacao_ripe_f.p3d") exitWith { hint "Das sieht nicht nach Kakao aus..."; };
lilc_action_active = true;
if ((damage _cocoa) > 0) exitWith { hint "Du brauchst schon eine ungeerntete Pflanze..."; };

_amount = (round (random 10));

lilc_action_animDone = false;
player playMoveNow "Acts_Executioner_Forehand";
lilc_action_animIndex = player addEventHandler ["AnimDone", {
    lilc_action_animDone = true;
    player switchMove "";
    player removeEventHandler ["AnimDone", lilc_action_animIndex];
    lilc_action_animIndex = nil;
}];
waitUntil { lilc_action_animDone || (damage _cocoa) == 1 };
lilc_action_animDone = nil;
if ((damage _cocoa) == 1) exitWith { player switchMove ""; };

_groundWeaponHolder = "GroundWeaponHolder" createVehicle position _cocoa;
_groundWeaponHolder addItemCargo ["lilci_cocoa_F", _amount];

_cocoa setDamage 1;
hint "Du hast alle Kokusnüsse geerntet.";
