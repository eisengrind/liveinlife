
(
    !(player getVariable ["ace_captives_isSurrendering", false]) &&
    !(player getVariable ["ace_captives_isHandcuffed", false]) &&
    ([player] call lilc_common_fnc_isAlive)
);
