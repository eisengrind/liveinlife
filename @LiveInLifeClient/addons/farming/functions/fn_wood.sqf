
_wood = param [0, ObjNull, [ObjNull]];
if (isNull _wood) exitWith {}; 
if ((_wood distance2D player) > 5) exitWith {};
if !(([_wood] call lilc_farming_fnc_isTree)) exitWith {};
if ((damage _wood) > 0) exitWith { hint "Der Baum ist schon gefällt."; };
if (lilc_action_active) exitWith {};
lilc_action_active = true; 
 
_amount = (round (random [2, 6, 10])); 
 
for "_i" from 1 to 3 do { 
    lilc_action_animDone = false; 
    player playMoveNow "Acts_Executioner_Forehand"; 
    lilc_action_animIndex = player addEventHandler ["AnimDone", { 
        player removeEventHandler ["AnimDone", lilc_action_animIndex]; 
        player switchMove ""; 
        lilc_action_animIndex = nil; 
        lilc_action_animDone = true; 
    }]; 
    waitUntil { lilc_action_animDone || (damage _wood) == 1 };
    if ((damage _wood) == 1) exitWith {};
};

if ((damage _wood) == 1) exitWith { player switchMove ""; };
 
_groundWeaponHolder = "GroundWeaponHolder" createVehicle position _wood; 
_groundWeaponHolder addItemCargoGlobal ["lilci_woodpile_F", _amount]; 

lilc_action_active = false;
_wood setDamage 1; 
hint "Du hast diesen Baum gefällt.";
