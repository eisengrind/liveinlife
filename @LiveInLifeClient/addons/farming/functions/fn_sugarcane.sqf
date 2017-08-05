
_sugarcane = param [0, ObjNull, [ObjNull]];
if (isNull _sugarcane) exitWith {};
if ((_sugarcane distance2D player) > 8) exitWith {};
if !(((getModelInfo _sugarcane) select 0) in ["b_sugarcane_sapling_row_f.p3d", "b_sugarcane_mature_row_f.p3d"]) exitWith { hint "Das sieht nicht nach Zuckerrohr aus..."; };
lilc_action_active = true;
if ((damage _sugarcane) > 0) exitWith { hint "Du brauchst schon eine ungeerntete Pflanze..."; };

_amount = 0;

switch ((getModelInfo _sugarcane) select 0) do {
    case "b_sugarcane_sapling_row_f.p3d": { _amount = (round (random 5)); };
    case "b_sugarcane_mature_row_f.p3d": { _amount = (round (random 10)); };
};

lilc_action_animDone = false;
player playMoveNow "Acts_Executioner_Forehand";
lilc_action_animIndex = player addEventHandler ["AnimDone", {
    lilc_action_animDone = true;
    player switchMove "";
    player removeEventHandler ["AnimDone", lilc_action_animIndex];
    lilc_action_animIndex = nil;
}];
waitUntil { lilc_action_animDone || (damage _sugarcane) == 1 };
lilc_action_animDone = nil;
if ((damage _sugarcane) == 1) exitWith {};

_groundWeaponHolder = "GroundWeaponHolder" createVehicle position _sugarcane;
_groundWeaponHolder addItemCargo ["lilci_sugarcane_F", _amount];

_sugarcane setDamage 1;
hint "Du hast Zuckerrohr geerntet.";
