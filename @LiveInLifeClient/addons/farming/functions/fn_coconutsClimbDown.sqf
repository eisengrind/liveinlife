
player playMoveNow "laddercivildownloop";
lilc_action_pos1 = getPosASL player; 
lilc_action_pos2 = lilc_action_pos1 vectorAdd [0, 0, -0.75]; 
player addEventHandler ["AnimDone", { 
    lilc_action_pos1 = lilc_action_pos2;  
    lilc_action_pos2 = lilc_action_pos2 vectorAdd [0, 0, -0.75];
    player playMoveNow "laddercivildownloop";
}];

["lilc_jobs_coconut", "onEachFrame", {
    if (((getPosATL player) select 2) < 0.5 || !alive player) then { 
        ["lilc_jobs_coconut", "onEachFrame"] call BIS_fnc_removeStackedEventhandler;
        player removeAllEventHandlers "AnimDone";
        player switchMove "";
        player setPosASL lilc_action_lastPosition;
        lilc_action_finished = true;

    } else {
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
    };
}] call BIS_fnc_addStackedEventhandler;
