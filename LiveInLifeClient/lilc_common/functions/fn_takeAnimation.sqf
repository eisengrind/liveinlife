
try {
    [player, "AmovPercMstpSrasWrflDnon_gear_AmovPercMstpSrasWrflDnon"] call lilc_common_fnc_switchMove;

    lilc_common_animationTaken = false;
    lilc_common_takeAnimationIndex = player addEventHandler ["AnimDone", {
        lilc_common_animationTaken = true;
        player removeEventHandler ["AnimDone", lilc_common_takeAnimationIndex];
    }];

    waitUntil { lilc_common_animationTaken };
    throw true;
} catch {
    _exception;
};
