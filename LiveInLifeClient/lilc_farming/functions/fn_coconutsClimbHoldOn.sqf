
player playMoveNow "laddercivilstatic";
lilc_action_timeout = time + 15;
["lilc_jobs_coconut", "onEachFrame", {
    if (lilc_action_timeout <= time || !alive player) then {
        ["lilc_jobs_coconut", "onEachFrame"] call BIS_fnc_removeStackedEventhandler;
        lilc_action_finished = true;
    };
    
    player setVelocityTransformation [ 
        lilc_action_pos1,  
        lilc_action_pos1,  
        [0, 0, 0],  
        [0, 0, 0],  
        [0, 1, 0],  
        [0, 1, 0],  
        [0, 0, 1],  
        [0, 0, 1], 
        moveTime player
    ];
}] call BIS_fnc_addStackedEventhandler;
