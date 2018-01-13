
lilc_action_curVectorDir = vectorDir player;
lilc_action_maxHeight = _this select 1;
lilc_action_pos1 = (ATLToASL (_this select 0));
player setPosASL lilc_action_pos1;
player playMoveNow "LadderRifleUpLoop";

lilc_action_animDone = false;
player addEventHandler ["AnimDone", { lilc_action_animDone = true; }];
waitUntil { lilc_action_animDone };

lilc_action_pos2 = lilc_action_pos1 vectorAdd [0,0,0.75]; 
player addEventHandler ["AnimDone", { 
    lilc_action_pos1 = lilc_action_pos2;  
    lilc_action_pos2 = lilc_action_pos2 vectorAdd [0,0,0.75];
    player playMoveNow "LadderRifleUpLoop";
}];

["jobs_coconut", "onEachFrame", {
    if (((getPosATL player) select 2) >= lilc_action_maxHeight || !alive player) then {
        ["jobs_coconut", "onEachFrame"] call BIS_fnc_removeStackedEventhandler;
        player removeAllEventHandlers "AnimDone";
        
        if (alive player) then {
            lilc_action_finished = true;
        } else {
            lilc_action_finished = false;
        };
    };
    
    player setVelocityTransformation [ 
        lilc_action_pos1,  
        lilc_action_pos2,  
        [0, 0, 0],  
        [0, 0, 0],  
        lilc_action_curVectorDir,  
        lilc_action_curVectorDir,  
        [0, 0, 1],  
        [0, 0, 1], 
        moveTime player 
    ];
}] call BIS_fnc_addStackedEventhandler;
