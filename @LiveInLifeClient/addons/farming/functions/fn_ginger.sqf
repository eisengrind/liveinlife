
_ginger = param [0, ObjNull, [ObjNull]];
if (isNull _ginger) exitWith {};
if ((_ginger distance2D player) > 10) exitWith {};
if !(((getModelInfo _ginger) select 0) in ["b_ginger_9_f.p3d", "b_ginger_3_f.p3d"]) exitWith { hint "Das sieht nicht nach Ingwer aus..."; };
jobs_gatherGinger_active = true;
if ((damage _ginger) > 0) exitWith { hint "Du brauchst schon eine ungeerntete Pflanze..."; };

_amount = (round (random 10));

lilc_action_animDone = false;
player playMoveNow "Acts_Executioner_Forehand";
lilc_action_animIndex = player addEventHandler ["AnimDone", {
    lilc_action_animDone = true;
    player switchMove "";
    player removeEventHandler ["AnimDone", lilc_action_animIndex];
    lilc_action_animIndex = nil;
}];
waitUntil { lilc_action_animDone || (damage _ginger) == 1};
lilc_action_animDone = nil;
if ((damage _ginger) == 1) exitWith { player switchMove ""; };

_groundWeaponHolder = "GroundWeaponHolder" createVehicle position _ginger;
_groundWeaponHolder addItemCargo ["lilci_ginger_F", _amount];

hint "Du hast den Ingwer-Busch geerntet.";
