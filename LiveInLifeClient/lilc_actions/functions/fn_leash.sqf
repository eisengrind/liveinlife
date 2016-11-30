
_type = param [0, 0, [0]];

try {
    if (_type == 0) throw false;
    if !((player getVariable ["lilc_tiedUp", 0]) <= 0) throw false;
    
    player setVariable ["lilc_tiedUp", _type, true];
    player playMove "AmovPercMstpSnonWnonDnon_EaseIn";
    disableUserInput true;

    lilc_actions_lastPlayerPosition = ([player] call lilc_common_fnc_getPosition);

    private _getInEHIndex = player addEventhandler ["GetIn", {
        moveOut player;
        [player, lilc_actions_lastPlayerPosition] call lilc_common_fnc_setPosition;
    }];

    while { (player getVariable ["lilc_tiedUp", false]) && alive player && !isNull player } do {
        [player, "AmovPercMstpSnonWnonDnon_Ease"] call lilc_common_fnc_switchMove;
        player playMove "AmovPercMstpSnonWnonDnon_Ease";
    };

    player playMove "AmovPercMstpSnonWnonDnon_EaseOut";
    player setVariable ["lilc_tiedUp", 0, true];
    player removeEventHandler ["GetIn", _getInEHIndex];

    disableUserInput false;
    lilc_actions_lastPlayerPosition = [];

    throw true;
} catch {
    _exception;
};


