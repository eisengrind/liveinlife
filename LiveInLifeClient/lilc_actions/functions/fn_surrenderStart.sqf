
if ((player getVariable ["lilc_surrender", false])) exitWith {};
player setVariable ["lilc_surrender", true, true];
//[player, "AmovPercMstpSsurWnonDnon"] call lilc_common_fnc_switchMove;
player playMoveNow "AmovPercMstpSsurWnonDnon";

lilc_actions_lastPlayerPosition = ([player] call lilc_common_fnc_getPosition);

private _getInEHIndex = player addEventhandler ["GetIn", {
    moveOut player;
    [player, lilc_actions_lastPlayerPosition] call lilc_common_fnc_setPosition;
}];

waitUntil { !(player getVariable ["lilc_surrender", false]) || !alive player || isNull player };
//player switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
[player, "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"] call lilc_common_fnc_switchMove;
player removeEventHandler ["GetIn", _getInEHIndex];
player setVariable ["lilc_surrender", false, true];
